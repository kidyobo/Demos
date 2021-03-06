
local fontName = "Droid Sans Fallback"
local fontSize = 30.0
local fontColor = ccc3(00,0x33,00)


AnnouncementPanel = class(BasePanel)

local configPath = HeResPathUtils:getUserDataPath() .. "/AnnouncementConfig" 
local function readConfig( ... )
	local file = io.open(configPath, "r")
	if file then
		local data = file:read("*a") 
		file:close()
		if data then
			return table.deserialize(data) or {}
		end
	end
	return {}
end
local function writeConfig( data )
	local file = io.open(configPath,"w")
	if file then 
		file:write(table.serialize(data or {}))
		file:close()
	end
end


function AnnouncementPanel:create( announcements,preloadingScene )
	local panel = AnnouncementPanel.new()
	panel:loadRequiredResource("ui/announcement_panel.json")
	panel:init(announcements,preloadingScene)
	return panel	
end
function AnnouncementPanel:ctor( ... )
	self.cells = {}
end
function AnnouncementPanel:dispose( ... )
	for _,v in pairs(self.cells) do
		v:dispose()
	end

	BasePanel.dispose(self)
end

function AnnouncementPanel:init( announcements,preloadingScene )
	print("AnnouncementPanel:init")

	local config = readConfig()
	for k,v in pairs(announcements) do
		if not config[v.id] then 
			config[v.id] = { times = 0 }
		end
		config[v.id].times = config[v.id].times + 1
	end
	config.lastPopout = os.time()
	writeConfig(config)

	self.ui = self:buildInterfaceGroup("AnnouncementPanel/panel2")
	BasePanel.init(self, self.ui)

	local visibleSize = Director.sharedDirector():getVisibleSize()
	local visibleOrigin = Director:sharedDirector():getVisibleOrigin()

	local bg = self.ui:getChildByName("bg")
	local size = bg:getGroupBounds().size

	local btn = self.ui:getChildByName('closeButton')
	btn:setTouchEnabled(true)
	btn:addEventListener(DisplayEvents.kTouchTap,function(event) self:onKeyBackClicked() end)

	local title = self.ui:getChildByName('title')




	local tableWidth = size.width - 60
	local tableHeight = size.height - 160

	for i,v in ipairs(announcements) do
		table.insert(self.cells,self:buildCell(i,v,tableWidth))
	end

	local function setPanelHeight(height)
		local originalSize = self.ui:getGroupBounds().size
		local originalHeight = originalSize.height
		local originalWidth = originalSize.width
		local scale = height / originalHeight
		local diffHeight = height - originalHeight
		self.ui:getChildByName('bg'):setPreferredSize(CCSizeMake(originalWidth, height))
		self.ui:getChildByName('bottom_deco'):setPositionY(self.ui:getChildByName('bottom_deco'):getPositionY() - diffHeight)
		self.ui:getChildByName('stamp'):setPositionY(self.ui:getChildByName('stamp'):getPositionY() - diffHeight)
		self.ui:getChildByName('left_deco'):setScaleY(scale)
		self.ui:getChildByName('right_deco'):setScaleY(scale)
	end

	local extendPanelHeight = 150
	-- topMargin是为了不挡住上面“开心消消乐”字样
	if #announcements == 1 then
		self.topMargin = 500
	else -- 多于一条的时候，面板略微拉长
		self.topMargin = 400
		tableHeight = tableHeight + extendPanelHeight
		setPanelHeight(size.height + extendPanelHeight)
	end

	self.tableView = self:buildTableView(tableWidth,tableHeight)
	self.tableView:setPositionX(700/2 - tableWidth/2 + 10) -- 微调
	self.tableView:setPositionY(title:getPositionY() - 100)

	self.ui:addChild(self.tableView)
end

function AnnouncementPanel:buildTableView(width,height)
	local layout = VerticalTileLayout:create(width)
	for k, v in pairs(self.cells) do 
		local item = ItemInClippingNode:create()
		item:setContent(v)
		v:setAnchorPoint(ccp(0, 0))
		-- item:setHeight(300)
		item:setParentView(container)
		layout:addItem(item)
	end

	local layoutHeight = layout:getHeight()
	if layoutHeight > height then		
		local container = VerticalScrollable:create(width, height, true, false)
		container:setContent(layout)
		return container
	else
		return layout
	end
end

function AnnouncementPanel:buildCell(i,announcement,width)
	local text = self:buildRichText(i .. "." .. announcement.announcementContent,width)

	local container = CocosObject:create()

	if string.len(announcement.linkText or "") > 0 and string.len(announcement.link or "") > 0 then 
		local link = self:buildInterfaceGroup("AnnouncementPanel/link")

		local linkText = link:getChildByName("text")
		local linkLine = link:getChildByName("line")

		linkText:setDimensions(CCSizeMake(0,0))
		linkText:setString(announcement.linkText)
		linkLine:setScaleX(linkText:getContentSize().width/linkLine:getContentSize().width)
		local linkSize = link:getGroupBounds().size

		text:setPositionX(0)
		text:setPositionY(linkSize.height + 35)
		link:setPositionX(text:getGroupBounds().size.width - linkSize.width - 10) -- 微调
		link:setPositionY(linkSize.height + 30)

		container:addChild(text)
		container:addChild(link)

		link:setButtonMode(true)
		link:setTouchEnabled(true)
		link:addEventListener(DisplayEvents.kTouchTap,function ( ... )
			if __IOS then
				UIApplication:sharedApplication():openURL(NSURL:URLWithString(announcement.link))
			elseif __ANDROID then
				luajava.bindClass("com.happyelements.android.utils.HttpUtil"):openUri(announcement.link)
			elseif __WP8 then
				Wp8Utils:OpenUrl(announcement.link)
			end
		end)
		link.hitTestPoint = function(s,worldPosition, useGroupTest) 				
			if self.tableView:boundingBox():containsPoint(self:convertToNodeSpace(worldPosition)) then
		 		return CocosObject.hitTestPoint(s,worldPosition, useGroupTest)
		 	else
		 		return false
		 	end
		end

	else
		text:setAnchorPoint(ccp(0,0))
		text:setPositionX(0)
		text:setPositionY(30)

		container:addChild(text)

	end

	local newContainer = Layer:create()
	newContainer:addChild(container)
	container:setPositionY(0-container:getGroupBounds().size.height)
	return newContainer
end

function AnnouncementPanel.loadAnnouncement( callback )
	
	local config = readConfig()
	if os.time() - (config.lastPopout or 0) < 24 * 3600 then 
		callback(nil)
		return
	end

	local function onCallback(response)
		if response.httpCode ~= 200 then 
			callback(nil)
		else
			callback(response.body)
		end
	end

	local url = NetworkConfig.maintenanceURL
	local uid = UserManager.getInstance().uid

	local params = string.format("?name=announcement&_v=%s", _G.bundleVersion)
	url = url .. params
	print(url)

	local request = HttpRequest:createGet(url)

	local timeout = 3
  	local connection_timeout = 2

  	if __WP8 then 
    	timeout = 30
    	connection_timeout = 5
  	end

    request:setConnectionTimeoutMs(connection_timeout * 1000)
    request:setTimeoutMs(timeout * 1000)

    if not PrepackageUtil:isPreNoNetWork() then 
   		HttpClient:getInstance():sendRequest(onCallback, request)
   	else
	    print("AnnouncementPanel================no network prepackage")
   	end
end

function AnnouncementPanel.parseAnnouncement( content )

	local announcementXML = xml.eval(content)
	local announcements = xml.find(announcementXML, "announcement")

	if not announcements then
		return {}
	end

	local platformName = StartupConfig:getInstance():getPlatformName()
	local config = readConfig()

	local function filter( group )
		-- do 
		-- 	return group[1]
		-- end


		local v = table.find(group,function(a) 
			if a.enable == "false" then 
				return (a.version == "default" or table.exist(a.version:split(","),_G.bundleVersion)) and 
			   			(a.platform == "default" or table.exist(a.platform:split(","),platformName)) 
			end
			return false
		end)
		if v then
			return nil
		end

		local g = table.filter(group,function(a) return a.enable ~= "false"  end)

		local v = table.find(g,function(a) 
			return table.exist(a.version:split(","),_G.bundleVersion) and table.exist(a.platform:split(","),platformName)
		end)
		if v then 
			return v
		end

		local v = table.find(g,function(a) 
			return a.version == "default" and table.exist(a.platform:split(","),platformName)
		end)
		if v then 
			return v
		end

		local v = table.find(g,function(a) 
			return table.exist(a.version:split(","),_G.bundleVersion) and a.platform == "default"
		end)
		if v then
			return v
		end

		local v = table.find(g,function(a)
			return a.version == "default" and a.platform == "default" 
		end)
		if v then 
			return v
		end

		-- for k,v in pairs(group) do
		-- 	if v.enable ~= "false" then

		-- 		if (v.version == "default" or table.exist(v.version:split(","),_G.bundleVersion)) and 
		-- 		   (v.platform == "default" or table.exist(v.platform:split(","),platformName)) then 
		-- 			return v
		-- 		end	
		-- 	end
		-- end
		return nil
	end

	local ret = {}
	local announcements = table.filter(announcements,function(v) return type(v) == "table" end)
	for _,v in pairs(table.groupBy(announcements,function(a) return a.key or "" end)) do
		local v2 = filter(v)
		if v2 then 
			ret[v2.id] = v2
		end
	end


	ret = table.filter(ret,function(v)  
		local times = tonumber(v.times) or -1
		if times > 0 and config[v.id] then 
			if config[v.id].times >= times then
				return false
			end
		end
		return true
	end)

	table.sort(ret,function(a,b) return tonumber(a.id) < tonumber(b.id) end)

	return ret
end




function AnnouncementPanel:buildRichText(text,width)

	local cacheWidths = {}
	local cacheLabels = {}
	local function createLabel(text)
		if cacheLabels[text] and cacheLabels[text]:getParent() then 
			 cacheLabels[text] = nil
		end
		if not cacheLabels[text] then 
			cacheLabels[text] = CCLabelTTF:create(text,fontName,fontSize)
		end
		return cacheLabels[text]
	end
	local function measureWidth(text)
		if not cacheWidths[text] then 
			local label = createLabel(text)
			cacheWidths[text] = label:getContentSize().width

			print("measureWidth " .. text)
		end
		return cacheWidths[text]
	end

	local container = CCNode:create()

	-- text = string.rep("有个事通知你一下，村长表示明天可以出院了。1232132.",1)
	-- text = string.rep("有个事通知[#FFFF00]你一下，村长[#FF0000]表示明天可以出院了。12[/#]32132.[/#]",10)
	-- text = "[#FF0000]" .. text .. "[/#]1232"

	local list = {}
	local stack = {
		{ text=text,color="003300" }
	}
	while #stack > 0 do 

		local s2,e2 = string.find(stack[#stack].text,"%[/#%]")
		if not s2 then 
			s2 = #stack[#stack].text + 1
			e2 = #stack[#stack].text - 1
		end

		local temp = string.sub(stack[#stack].text,1,s2-1)
		local s1,e1,color = string.find(temp,"%[#([0-9A-Fa-f]-)%]")

		if s1 then 
			local text1 = string.sub(stack[#stack].text,1,s1-1)
			local text2 = string.sub(stack[#stack].text,e1+1,#stack[#stack].text)

			table.insert(list,{ text=text1,color=stack[#stack].color })
			table.insert(stack,{ text=text2,color=color })
		else
			local text1 = string.sub(stack[#stack].text,1,s2-1)
			local text2 = string.sub(stack[#stack].text,e2+1,#stack[#stack].text)

			table.insert(list,{ text=text1,color=stack[#stack].color})
			table.remove(stack,#stack)
			if #stack > 0 then 
				stack[#stack].text = text2
			end
		end

	end
	
	list = table.filter(list,function( v ) return string.len(v.text) > 0 end)

	local posX=0
	local posY=0
	local labels = {}
	local lineHeight = nil

	local function addLabel( label )
		label:setAnchorPoint(ccp(0,0))
		label:setPositionX(posX)
		label:setPositionY(posY)

		container:addChild(label)
		if not lineHeight then 
			lineHeight = label:getContentSize().height
		end

		table.insert(labels,label)
	end

	for k,v in pairs(list) do

		local t = {}
		for uchar in string.gfind(v.text, "[%z\1-\127\194-\244][\128-\191]*") do
			t[#t + 1] = uchar
		end

		local function sub( s,e )
			local t2 = {}
			for i=s,e do
				t2[i-s+1] = t[i]
			end
			return table.concat(t2,"")
		end

		local start = 1
		while start <= #t do

			local str = ""

			local len = #t - start + 1
			local _end = #t
			local i = 2
			local newLine = false
			while true do 
				newLine = false
				local str1 = sub(start,_end)

				if str1 == "" then
					str = ""
					_end = start - 1
					newLine = true
					break
				end

				local w1 = measureWidth(str1)
					if _end == #t and posX + w1 <= width then --or str1 == "" 
					str = str1
					break
				end

				local str2 = sub(start,math.min(#t,_end + 1))
				local w2 = measureWidth(str2)

				if posX + w1 <= width and posX + w2 > width then 
					str = str1
					newLine = true
					break
				end

				if posX + w1 > width then 
					_end = _end - math.ceil(len / i) 
				elseif posX + w2 <= width then 
					_end = _end + math.ceil(len / i)
				end
				i = i * 2
			end
			start = _end + 1


			if str ~= "" then 
				local label = createLabel(str)--CCLabelTTF:create(str,fontName,fontSize)
				label:setColor(HeDisplayUtil:ccc3FromUInt(tonumber(v.color,16)))
				addLabel(label)

				posX = posX + label:getContentSize().width
			end

			if newLine then 
				posX = 0
				posY = posY - lineHeight
			end
		end
	end

	container:setContentSize(CCSizeMake(width,math.abs(posY) + lineHeight))
	for _,v in pairs(labels) do
		v:setPositionY(v:getPositionY() + math.abs(posY))
	end

	return CocosObject.new(container)
end

function AnnouncementPanel:popout(closeCallback)
	PopoutManager:sharedInstance():add(self, false, false)
	self.allowBackKeyTap = true

	local visibleSize = Director.sharedDirector():getVisibleSize()
	local scale = visibleSize.height / 1280

	local bounds = self.ui:getChildByName("bg"):getGroupBounds()

	self:setPositionX(visibleSize.width/2 - bounds.size.width/2)
	self:setPositionY((0-self.topMargin) * scale)
	self.closeCallback = closeCallback
end

function AnnouncementPanel:onKeyBackClicked()
	PopoutManager:sharedInstance():remove(self)
	self.allowBackKeyTap = false
	if self.closeCallback then
		self.closeCallback() 
	end
end