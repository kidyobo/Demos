
--icontip优化优先级规则
	--活动相关的
		--活动 			1--999
		--活动中心 		1000
		--周赛 			1010
	--主界面按钮相关的
		--道具商店		10
		--风车币商店	20
		--瓢虫			30
		--签到			40
-----------------------
IconTipState = table.const{
	kNormal = "_1",	
	kExtend = "_2", 
	kReward = "_3",
}

IconButtonManager = class()

local instance = nil
local function getDayStartTimeByTS(ts)
	local utc8TimeOffset = 57600 -- (24 - 8) * 3600
	local oneDaySeconds = 86400 -- 24 * 3600
	return ts - ((ts - utc8TimeOffset) % oneDaySeconds)
end

local configPath = HeResPathUtils:getUserDataPath() .. "/IconButtonManager" 

local function readConfig()
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

local function writeConfig(data)
	local file = io.open(configPath,"w")
	if file then 
		file:write(table.serialize(data or {}))
		file:close()
	end
end

local function now()
	return os.time() + (__g_utcDiffSeconds or 0)
end

function IconButtonManager:getInstance()
	if not instance then 
		instance = IconButtonManager.new()
		instance:init()
	end

	return instance
end

function IconButtonManager:ctor()
	--活动和周赛按钮
	self.playTipActivityIcons = {}
	--普通主界面按钮
	self.playTipNormalIcons = {}

	self.clickReplaceScene = false
end

function IconButtonManager:init()
	local function removeTips()
		local activityIcons = {}
		for _,v in pairs(self.playTipActivityIcons) do
			if v.playTipPriority == self.playTipActivityIcons[1].playTipPriority and not self:isActivityButton(v) then
				table.insert(activityIcons,v)
			end
		end
		for _,v in pairs(activityIcons) do
			self:removePlayTipActivityIcon(v)
		end

		local normalIcons = {}
		for _,v in pairs(self.playTipNormalIcons) do
			if v.playTipPriority == self.playTipNormalIcons[1].playTipPriority then
				table.insert(normalIcons,v)
			end
		end
		for _,v in pairs(normalIcons) do
			self:removePlayTipNormalIcon(v)
		end
	end

	local eventNode = CocosObject:create()
	HomeScene:sharedInstance():addChild(eventNode)
	eventNode:addEventListener(Events.kRemoveFromStage,function()
		if not self.clickReplaceScene then
			-- removeTips()
		end
		self.clickReplaceScene = false
	end)

	HomeScene:sharedInstance():addEventListener(SceneEvents.kEnterForeground,function()
		if not HomeScene:sharedInstance().exitDialog then 
			removeTips()
		end
	end)
end

function IconButtonManager:todayIsShow(icon)
	if icon:is(MessageButton) then 
		return false
	end

	local config = readConfig()

	if not config[icon.id] then 
		return false
	end

	if IconButtonManager:getInstance():isActivityButton(icon) then 
		if icon.tips and icon.tips ~= config[icon.id].tips then 
			return false
		end
	end

	local lastShowTime = getDayStartTimeByTS(config[icon.id].time or 0)
	local todayTime = getDayStartTimeByTS(now())
	return lastShowTime >= todayTime
end

function IconButtonManager:clearShowTime(icon)
	local config = readConfig()

	if not config[icon.id] then 
		config[icon.id] = {}
	end

	config[icon.id].time = 0

	writeConfig(config)
end

function IconButtonManager:writeShowTime(icon)
	if icon:is(MessageButton) then 
		return
	end

	local config = readConfig()

	if not config[icon.id] then 
		config[icon.id] = {}
	end
	if IconButtonManager:getInstance():isActivityButton(icon) then 
		if icon.tips then 
			config[icon.id].tips = icon.tips
		end	
	end

	config[icon.id].time = now()
	writeConfig(config)
end

function IconButtonManager:isActivityButton(icon)
	return icon:is(ActivityIconButton) or icon:is(ActivityButton)
end

local function delayProcess(callback)
	local funcId = nil
	local function onDelayProcessTick()
		if funcId ~= nil then CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(funcId) end
		funcId = nil
		if callback then callback() end 
	end
	funcId = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(onDelayProcessTick, 0.1)
end

function IconButtonManager:playActivityHasNotificationAnim()
	local function processFunc()
		for _,v in pairs(self.playTipActivityIcons) do
			IconButtonBase.stopHasNotificationAnim(v)
		end

		for i,v in ipairs(self.playTipActivityIcons) do
			if v.playTipPriority > self.playTipActivityIcons[1].playTipPriority then 
				v:playOnlyIconAnim()
				self:clearShowTime(v)
			else
				IconButtonBase.playHasNotificationAnim(v)
				
				if not IconButtonManager:getInstance():isActivityButton(v) then 
					self:writeShowTime(v)
				end
			end
		end
	end
	delayProcess(processFunc)
end

function IconButtonManager:playNormalHasNotificationAnim()
	local function processFunc()
		for _,v in pairs(self.playTipNormalIcons) do
			IconButtonBase.stopHasNotificationAnim(v)
		end

		for i,v in ipairs(self.playTipNormalIcons) do
			if v.playTipPriority > self.playTipNormalIcons[1].playTipPriority then 
				v:playOnlyIconAnim()
				self:clearShowTime(v)
			else
				IconButtonBase.playHasNotificationAnim(v)
				
				self:writeShowTime(v)
			end
		end
	end
	delayProcess(processFunc)
end

function IconButtonManager:addPlayTipActivityIcon(icon)
	if not table.exist(self.playTipActivityIcons,icon) then
		if self:todayIsShow(icon) then 
			return
		end

		table.insert(self.playTipActivityIcons,icon)
		table.sort(self.playTipActivityIcons,function(a,b) return a.playTipPriority < b.playTipPriority end)

		local eventNode = CocosObject:create()
		icon:addChild(eventNode)
		eventNode:addEventListener(Events.kDispose,function()
			self:removePlayTipActivityIcon(icon)
		end)
	end
	
	self:playActivityHasNotificationAnim()
	print("addPlayTipActivityIcon " .. icon.id)
end

function IconButtonManager:removePlayTipActivityIcon(icon)
	if not table.exist(self.playTipActivityIcons,icon) then 
		return
	end

	table.removeValue(self.playTipActivityIcons,icon)
	IconButtonBase.stopHasNotificationAnim(icon)

	self:playActivityHasNotificationAnim()

	print("removePlayTipActivityIcon " .. icon.id)
	-- print(debug.traceback())
end

function IconButtonManager:addPlayTipNormalIcon(icon)
	if not table.exist(self.playTipNormalIcons,icon) then
		if self:todayIsShow(icon) then 
			return
		end

		table.insert(self.playTipNormalIcons,icon)
		table.sort(self.playTipNormalIcons,function(a,b) return a.playTipPriority < b.playTipPriority end)

		local eventNode = CocosObject:create()
		icon:addChild(eventNode)
		eventNode:addEventListener(Events.kDispose,function()
			self:removePlayTipNormalIcon(icon)
		end)
	end
	
	self:playNormalHasNotificationAnim()
	print("addPlayTipNormalIcon " .. icon.id)
end

function IconButtonManager:removePlayTipNormalIcon(icon)
	if not table.exist(self.playTipNormalIcons,icon) then 
		return
	end

	table.removeValue(self.playTipNormalIcons,icon)
	IconButtonBase.stopHasNotificationAnim(icon)

	self:playNormalHasNotificationAnim()

	print("removePlayTipNormalIcon " .. icon.id)
	-- print(debug.traceback())
end

function IconButtonManager:writeShowTimeInQueue(icon)
	if not table.exist(self.playTipActivityIcons, icon) then
		return
	end
	self:writeShowTime(icon)
end

function IconButtonManager:getButtonTodayShowById(buttonId)
	local config = readConfig()

	if not config[buttonId] then 
		return false
	end
	
	if not config[buttonId].time or config[buttonId].time == 0 then 
		config[buttonId].time = now()
		writeConfig(config)
	end
	
	local lastShowTime = getDayStartTimeByTS(config[buttonId].time)
	local todayTime = getDayStartTimeByTS(now())

	return lastShowTime >= todayTime
end