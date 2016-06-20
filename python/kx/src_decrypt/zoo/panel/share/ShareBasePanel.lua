require "zoo.panel.basePanel.BasePanel"
require "zoo.net.OnlineGetterHttp"

ShareBasePanel = class(BasePanel)

local ShareType = {
	LINK = 1,
	IMAGE = 2,
	NOTIFY = 3
}

function ShareBasePanel:ctor()
	self.rewardConfig = nil
end

function ShareBasePanel:init()
	BasePanel.init(self,self.ui)
	self.achiManager = AchievementManager
	local config = self.achiManager:getConfig(self.shareId)
	self.config = config
	self.sharePriority = config.priority
	self.shareTitleKey = config.shareTitle
	self.shareType = config.shareType

	local function initBg_()
		self:initBg()
	end

	self.ui:runAction(CCCallFunc:create(initBg_))
	
	local titleName = self:getShareTitleName()
	self:initShareTitle(titleName)
	self:initShareBtn(self.shareType)

	self:runTitleAction()

	self.shareImagePath = HeResPathUtils:getResCachePath() .. "/share_image.jpg"
end

function ShareBasePanel:runTitleAction()
	self.shareTitle:setScale(0.5)
	local sequenceArr = CCArray:create()
	--CCEaseElasticOut
	sequenceArr:addObject(CCEaseBackOut:create(CCScaleTo:create(0.15, 1)))
	self.shareTitle:stopAllActions();
	self.shareTitle:runAction(CCSequence:create(sequenceArr));
end

function ShareBasePanel:initBg()
	local bg = self.ui:getChildByName('bg')
	local gradient = LayerGradient:create()
	gradient:setStartColor(ccc3(0, 0, 0))
	gradient:setEndColor(ccc3(0, 0, 0))
	gradient:setStartOpacity(200)
	gradient:setEndOpacity(200)

	local size = Director:sharedDirector():getVisibleSize()
	local origin = Director:sharedDirector():getVisibleOrigin()

	gradient:setContentSize(CCSizeMake(size.width, size.height))
	local pos = self.ui:convertToNodeSpace(ccp(origin.x, origin.y))
	gradient:setPosition(ccp(pos.x, pos.y))

	bg:getParent():addChildAt(gradient, bg:getZOrder())
	bg:removeFromParentAndCleanup(true) 

	self.closeBtnRes = self.ui:getChildByName("closeBtn")
	local btnSize = self.closeBtnRes:getGroupBounds().size
	
	self.closeBtnRes:setPosition(ccp(pos.x + size.width - btnSize.width / 2, pos.y + size.height - btnSize.height / 2))
	local function onCloseBtnTapped()
		self:removePopout()
	end
	self.closeBtnRes:setTouchEnabled(true)
	self.closeBtnRes:setButtonMode(true)
	self.closeBtnRes:addEventListener(DisplayEvents.kTouchTap, onCloseBtnTapped)
end

function ShareBasePanel:initShareTitle(titleName)
	assert(titleName)
	local shareTitleUI = self.ui:getChildByName("shareTitle")
	self.shareTitle = self:addToLayerColor(shareTitleUI,ccp(0.5,0)) 

	self.shareTitleString = TextField:createWithUIAdjustment(shareTitleUI:getChildByName("shareTitleSize"), shareTitleUI:getChildByName("shareTitle"))
	shareTitleUI:addChild(self.shareTitleString)
	self.shareTitleString:setString(titleName)
end

function ShareBasePanel:initShareBtn(shareType)
	self.btnTag = self.ui:getChildByName("btnTag")
	self.btnTagNum = self.btnTag:getChildByName("number")
	self.rewardConfig = ShareManager:getShareReward()
	if self.rewardConfig then 
		sprite = ResourceManager:sharedInstance():buildGroup("stackIcon")
		if sprite then
			sprite:setScale(0.3)
			local iconPos = self.btnTag:getChildByName("icon")
			iconPos:setVisible(false)
			sprite:setPositionXY(iconPos:getPositionX(), iconPos:getPositionY())
			local index = self.btnTag:getChildIndex(iconPos)
			self.btnTag:addChildAt(sprite, index)
		end
		self.btnTagNum:setText(self.rewardConfig.rewardNum)
	else
		self.btnTag:setVisible(false)
	end

	self.shareBtn = GroupButtonBase:create(self.ui:getChildByName('shareBtn'))
	if shareType == ShareType.NOTIFY then 
		self.shareBtn:setString(Localization:getInstance():getText('通知好友'))
	else
		self.shareBtn:setString(Localization:getInstance():getText('share.feed.button.achive'))
	end

	self.shareBtn:setEnabled(false)

	local function onShareBtnTapped()
		self:onShareBtnTapped()
	end

	local time = 1.5
	if self.shareId == 90 then
		time = 2
	end

	setTimeOut(function ()
		if self.isDisposed or not self.shareBtn then return end
		self.shareBtn:setEnabled(true)
		self.shareBtn:addEventListener(DisplayEvents.kTouchTap, onShareBtnTapped)
	end, time)
end

function ShareBasePanel:addToLayerColor(ui,anchorPoint)
	local size = ui:getGroupBounds().size
	local pos = ui:getPosition()
	local layer = LayerColor:create()
    layer:setColor(ccc3(0,0,0))
    layer:setOpacity(0)
    layer:setContentSize(CCSizeMake(size.width, size.height))
    layer:setAnchorPoint(anchorPoint)
    layer:setPosition(ccp(pos.x, pos.y-size.height))
    
    local uiParent = ui:getParent()
    local index = uiParent:getChildIndex(ui)
    ui:removeFromParentAndCleanup(false)
    ui:setPosition(ccp(0,size.height))
    layer:addChild(ui)
    uiParent:addChild(layer)

    return layer
end

function ShareBasePanel:beforeSrnShot(srnShot, afterSrnShot)
	if self.share_background ~= nil then
		return
	end
	self.share_background = Sprite:create("share/share_background.png")
	local y = self.shareTitle:getPositionY() - 45
	self.offsetY = y
	self.share_background:setAnchorPoint(ccp(0,0))

	local size = self.share_background:getContentSize()

	if _G.__use_small_res == true then
		self.share_background:setScale(0.625)
		size.width = size.width * 0.625
		size.height = size.height * 0.625
	end

	local children = self.ui:getChildrenList()

	for k,child in pairs(children) do
		local pos = child:getPosition()
		child:setPosition(ccp(pos.x, pos.y - y))
	end

	local btn = self.ui:getChildByName("closeBtn")
	btn:setVisible(false)

	self.ui:addChildAt(self.share_background, 1)

	local bg_2d = "share/share_background_2d.png"

	if _G.__use_small_res == true then
		bg_2d = "share/share_background_2d_small.png"
	end

	self.share_background_2d = Sprite:create(bg_2d)

	self.ui:addChild(self.share_background_2d)

	local size_2d = self.share_background_2d:getContentSize()
	self.share_background_2d:setPosition(ccp(size.width - size_2d.width / 2 - 5, size.height - size_2d.height / 2 - 15))

    local head_frame_pathname = 'share/share_background_head_frame.png'
	self.head_frame = Sprite:create(head_frame_pathname)
	local head_frame_size = self.head_frame:getContentSize()
	self.head_frame:setPositionXY(head_frame_size.width / 2 + 25, size.height - head_frame_size.height / 2 - 10)

	if _G.__use_small_res == true then
		self.head_frame:setScale(0.625)
		head_frame_size.width = head_frame_size.width * 0.625
		head_frame_size.height = head_frame_size.height * 0.625
	end

	local function onImageLoadFinishCallback(headImage)
        local pos = self.head_frame:getPosition()
        self.headImage = headImage
        self.headImage:setPositionXY(pos.x, pos.y)
        self.headImage:setScale(0.65)
        if _G.__use_small_res == true then
			self.headImage:setScale(0.625*0.65)
		end
        self.ui:addChild(self.headImage)
        self.ui:addChild(self.head_frame)

	    local pos = self.headImage:getPosition()
	    local username = UserManager.getInstance().profile:getDisplayName()
	    print('----------', username, '---------------')
	    self.username = TextField:create(username, "微软雅黑", 24, CCSizeMake(24*6, 24), kCCTextAlignmentCenter)
	    self.username:setAnchorPoint(ccp(0.5, 0))
	    self.username:setPositionXY(self.head_frame:getPositionX() + 2, pos.y - 65)
	    if _G.__use_small_res == true then
			self.username:setScale(0.625)
		end
	    self.ui:addChild(self.username)

	    if srnShot then
			srnShot()
		end
		if afterSrnShot then
	   		afterSrnShot()
	   	end
	end

    local uid = UserManager:getInstance().uid
    local headUrl = UserManager:getInstance().profile.headUrl
    HeadImageLoader:create(userId, headUrl, onImageLoadFinishCallback)
end

function ShareBasePanel:afterSrnShot()
	self.username:removeFromParentAndCleanup(true)
	self.headImage:removeFromParentAndCleanup(true)
	self.head_frame:removeFromParentAndCleanup(true)
	self.share_background:removeFromParentAndCleanup(true)
	self.share_background_2d:removeFromParentAndCleanup(true)
	for k,child in pairs(self.ui:getChildrenList()) do
		local pos = child:getPosition()
		child:setPosition(ccp(pos.x, pos.y + self.offsetY))
	end
	self.ui:getChildByName("closeBtn"):setVisible(true)
	self.share_background = nil
end

function ShareBasePanel:srnShot()
	local size = self.share_background:getContentSize()
	if _G.__use_small_res == true then
		size.width = size.width*0.625
		size.height = size.height*0.625
	end
	local renderTexture = CCRenderTexture:create(size.width, size.height)
	renderTexture:begin()
	self.ui:visit()
	renderTexture:endToLua()
	renderTexture:saveToFile(self.shareImagePath)
end

function ShareBasePanel:screenshotShareImage( ... )
	local function srnShot()
		self:srnShot()
	end
	local function afterSrnShot()
		self:afterSrnShot()
		self:sendShareImage()
	end
	self:beforeSrnShot(srnShot, afterSrnShot)
end

---新障碍 和 隐藏关 子类使用
function ShareBasePanel:unloadSpecialBackground()
	self.animal:removeFromParentAndCleanup(true)
	table.each(
		self.oldChildren,
		function(child)
			local visible = false
			if self.childrenVisibility and self.childrenVisibility[child] ~= nil then
				visible = self.childrenVisibility[child]
			end
			child:setVisible(visible)
		end
	)
	self.shareTitle:setPositionXY(self.titleOldPos.x, self.titleOldPos.y)
	ShareBasePanel.afterSrnShot(self)
end

---新障碍 和 隐藏关 子类使用
function ShareBasePanel:loadSpecialBackground()
	local children = self.ui:getChildrenList()
	self.oldChildren = children
	self.childrenVisibility = {}
	table.each(
		children,
		function(child)
			self.childrenVisibility[child] = child:isVisible()
			child:setVisible(false)
		end
	)

	self.shareTitle:setVisible(true)
	local titleOldPos = self.shareTitle:getPosition()
	self.titleOldPos = ccp(titleOldPos.x, titleOldPos.y)

	self.shareTitle:setPositionXY(
		self.share_background:getGroupBounds().size.width/2 - self.shareTitle:getGroupBounds().size.width/2,
		60
	)

	self.animal = Sprite:create("share/share_"..self.shareId..".png")
	self.animal:setAnchorPoint(ccp(0,0))
	self.ui:addChildAt(self.animal, 2)
	if _G.__use_small_res == true then
	   	self.animal:setScale(0.625)
	end
	
	self.username:setVisible(true)
	self.headImage:setVisible(true)
	self.head_frame:setVisible(true)
	self.share_background:setVisible(true)
	self.share_background_2d:setVisible(true)
end

function ShareBasePanel:onShareBtnTapped()
	self:screenshotShareImage()	
end
function ShareBasePanel:sendShareImage()
	if __IOS_FB then
		--炫耀功能重新做  但这里没有改
		--这里shareId有新增 
		if SnsProxy:isShareAvailable() then
			local replaceObj = {}
			if self.shareId == 10 then replaceObj.num = kMaxLevels * 3 end
			local message = Localization:getInstance():getText("share.feed.text"..self.shareId, replaceObj)

			local callback = {
				onSuccess = function(result)
					--button:setVisible(true)
					--self.gamelogo:setVisible(false)
					self:removePopout()
					--self:onShareSucceed()
					CommonTip:showTip(Localization:getInstance():getText("share.feed.success.tips"), "positive")
				end,
				onError = function(err)
					--button:setVisible(true)
					--self.gamelogo:setVisible(false)
					--self:removePopout()
					self:onShareFailed()
				end
			}
			local shareTitle = Localization:getInstance():getText("share.feed.title"..self.shareId)
			local shareImage = string.format("http://statictw.animal.he-games.com/mobanimal/fb/achievement/ach%04d.png", self.rewardID) 
			-- HeResPathUtils:getAppAssetsPath() .. "/resource/share/fb/share_" .. self.rewardID .. ".png"
			-- SnsProxy:sendNewFeedsWithLocalImage(FBOGActionType.REACH, FBOGObjectType.ACHIEVEMENT, shareTitle, message, shareImage, link, callback)
			SnsProxy:sendNewFeedsWithParams(FBOGActionType.REACH, FBOGObjectType.ACHIEVEMENT, shareTitle, message, shareImage, link, callback)
		end
	else
		DcUtil:UserTrack({category = "show", sub_category = "push_show_off", action = 'button', id = self.sharePriority}, true)

		local thumb = CCFileUtils:sharedFileUtils():fullPathForFilename("materials/wechat_icon.png")
		local shareCallback = {
			onSuccess = function(result)
				self:onShareSucceed()
			end,
			onError = function(errCode, errMsg)
				self:onShareFailed()
			end,
			onCancel = function()
				self:onShareFailed()
			end,
		}

		
		if PlatformConfig:isPlatform(PlatformNameEnum.kMiTalk) then
			SnsUtil.sendImageMessage( PlatformShareEnum.kMiTalk, self.shareTitleName, self.shareTitleName, thumb, self.shareImagePath, shareCallback )
		else
			SnsUtil.sendImageMessage( PlatformShareEnum.kWechat, self.shareTitleName, self.shareTitleName, thumb, self.shareImagePath, shareCallback )
		end
	end
end

function ShareBasePanel:onShareSucceed()
	--向后端同步
	local function onSuccess(event)
		if PlatformConfig:isPlatform(PlatformNameEnum.kMiTalk) then
	 		SnsUtil.showShareSuccessTip(PlatformShareEnum.kMiTalk) 
	 	else
	 		SnsUtil.showShareSuccessTip(PlatformShareEnum.kWechat)
	 	end
        --打点
        DcUtil:UserTrack({category = "show", sub_category = "push_show_off", action = 'success', id = self.sharePriority}, true)
        --关闭
        self:removePopout()

        --记录炫耀次数
        ShareManager:increaseShareAllTime()
    end

    local function onFail(event)
       	--关闭
        self:removePopout()
    end
    
    -- 需求，去掉分享奖励，此处不再发请求
	onSuccess()
end

function ShareBasePanel:onShareFailed()
	local scene = Director:sharedDirector():getRunningScene()
	if scene then
		local shareFailedLocalKey = "share.feed.faild.tips"
		CommonTip:showTip(Localization:getInstance():getText(shareFailedLocalKey), 'negative', nil, 2)
	end
end

function ShareBasePanel:removePopout()
	PopoutManager:sharedInstance():removeWithBgFadeOut(self, false, true)
end

function ShareBasePanel:popoutShowTransition()
	self:setToScreenCenterVertical()
	self:setToScreenCenterHorizontal()
end

function ShareBasePanel:popout()
	-- local scene = Director:sharedDirector():getRunningScene()
	-- if scene then 
	-- 	local origin = Director:sharedDirector():getVisibleOrigin()
	-- 	local winSize = CCDirector:sharedDirector():getVisibleSize()
	-- 	local size = self:getGroupBounds().size
	-- 	self:setPosition(ccp(origin.x, size.height+origin.y))

	-- 	scene:addChild(self) 
	-- end
	PopoutQueue.sharedInstance():push(self, false)
end