
-- Copyright C2009-2013 www.happyelements.com, all rights reserved.
-- Create Date:	2013年09月 1日 20:13:51
-- Author:	ZhangWan(diff)
-- Email:	wanwan.zhang@happyelements.com

require "zoo.scenes.component.HomeScene.item.CloudButton"
require "zoo.scenes.component.HomeScene.iconButtons.IconButtonBase"
require "zoo.scenes.component.HomeScene.item.StarButtonTip"
require "zoo.panel.HiddenBranchIntroductionPanel"
require "zoo.panel.quickselect.QuickSelectLevelPanel"
require "zoo.panel.quickselect.StarAchievenmentPanel"
require "zoo.panel.quickselect.LadybugPromptPanel"

---------------------------------------------------
-------------- StarButton
---------------------------------------------------

 -- CCApplication:sharedApplication():setAnimationInterval(1/30)

-- StarButton = class(CloudButton)
StarButton = class(IconButtonBase)
-- IconButtonBase
function StarButton:init(...)
	assert(#{...} == 0)

	-- -------------------
	-- Get UI Resource
	-- -------------------
	--self.ui		= ResourceManager:sharedInstance():buildGroup("itemWithProgressBar")
	self.ui		= ResourceManager:sharedInstance():buildGroup("newStarButton")
	self.playTipPriority = 1010

	-- -----------
	-- Init Base
	-- ------------
	-- CloudButton.init(self, self.ui)
	IconButtonBase.init(self, self.ui)

	-- Data
	self.normalStar	= 0
	self.hiddenStar	= 0
	self.totalStar	= 100
	self.normalHiddenSepChar	= "+"
	self.sepChar			= "/"

	----------------------
	-- Get UI Component
	-- -------------------
	self.blueBubbleItemRes	= self.ui:getChildByName("bubbleItem")
	self.progressBarRes	= self.ui:getChildByName("progressBar")

	self.numeratorPlaceholder	= self.ui:getChildByName("numerator")
	self.separatorPlaceholder	= self.ui:getChildByName("separator")
	self.denominatorPlaceholder	= self.ui:getChildByName("denominator")

	self.starIcon			= self.blueBubbleItemRes:getChildByName("placeHolder")
	self.shineAnim = self:addLayerColorWrapper(self.ui:getChildByName("shine"), ccp(0.5, 0.5))
	
	self.ui:getChildByName("wrapper"):setVisible(false)
	self.shineAnim:setVisible(false)

	assert(self.starIcon)

	assert(self.blueBubbleItemRes)
	assert(self.progressBarRes)

	assert(self.numeratorPlaceholder)
	assert(self.separatorPlaceholder)
	assert(self.denominatorPlaceholder)

	--------------------------------
	-- Get Data About UI Component
	-- ----------------------------
	self.numeratorPhPos	= self.numeratorPlaceholder:getPosition()
	self.separatorPhPos	= self.separatorPlaceholder:getPosition()
	self.denominatorPhPos	= self.denominatorPlaceholder:getPosition()

	self.numeratorPhSize	= self.numeratorPlaceholder:getPreferredSize()
	self.separatorPhSize	= self.separatorPlaceholder:getPreferredSize()
	self.denominatorPhSize	= self.denominatorPlaceholder:getPreferredSize()

	----------------------
	-- Init UI Component
	-- -----------------
	self.numeratorPlaceholder:setVisible(false)
	self.separatorPlaceholder:setVisible(false)
	self.denominatorPlaceholder:setVisible(false)

	-- Scale Small
	local config 	= UIConfigManager:sharedInstance():getConfig()
	local uiScale	= config.homeScene_uiScale
	self:setScale(uiScale)


	------------------------
	-- Create UI Componenet
	-- ---------------------
	self.bubbleItem		= HomeSceneBubbleItem:create(self.blueBubbleItemRes)

	-- Clipping The Bubble
	local stencil		= LayerColor:create()
	stencil:setColor(ccc3(255,0,0))
	stencil:changeWidthAndHeight(132, 75.15 + 30)
	stencil:setPosition(ccp(0, -75.15))
	local cppClipping	= CCClippingNode:create(stencil.refCocosObj)
	local luaClipping	= ClippingNode.new(cppClipping)
	stencil:dispose()
	
	self.ui:addChild(luaClipping)
	self.bubbleItem:removeFromParentAndCleanup(false)
	luaClipping:addChild(self.bubbleItem)

	self.progressBar	= HomeSceneItemProgressBar:create(self.progressBarRes, 
								self.normalStar + self.hiddenStar,
								self.totalStar)

	-- Create Monospace Label
	local numeratorCharWidth	= 35
	local numeratorCharHeight	= 35
	local numeratorCharInterval	= 18

	local separatorCharWidth	= 20
	local separatorCharHeight	= 20
	local separatorCharInterval	= 10

	local denominatorCharWidth	= 25
	local denominatorCharHeight	= 25
	local denominatorCharInterval	= 14

	local fntFile			= "fnt/hud.fnt"

	self.numerator		= LabelBMMonospaceFont:create(numeratorCharWidth, numeratorCharHeight, numeratorCharInterval, fntFile)
	self.separator		= LabelBMMonospaceFont:create(separatorCharWidth, separatorCharHeight, separatorCharInterval, fntFile)
	self.denominator	= LabelBMMonospaceFont:create(denominatorCharWidth, denominatorCharHeight, denominatorCharInterval, fntFile)

	self.separator:setString("/")

	self.numerator:setAnchorPoint(ccp(0,1))
	self.separator:setAnchorPoint(ccp(0,1))
	self.denominator:setAnchorPoint(ccp(0,1))

	self.numerator:setPosition(ccp(self.numeratorPhPos.x, self.numeratorPhPos.y))
	self.separator:setPosition(ccp(self.separatorPhPos.x, self.separatorPhPos.y))
	self.denominator:setPosition(ccp(self.denominatorPhPos.x, self.denominatorPhPos.y))

	self.ui:addChild(self.numerator)
	self.ui:addChild(self.separator)
	self.ui:addChild(self.denominator)

	-- ------------
	-- Update View
	-- --------------
	self.userRef	= UserManager.getInstance().user
	self:setNormalStar(self.userRef:getStar())
	self:setHiddenStar(self.userRef:getHideStar())
	self:setTotalStar(UserManager:getInstance():getFullStarInOpenedRegionInclude4star() + MetaModel.sharedInstance():getFullStarInOpenedHiddenRegion())

	self:updateView()

	self.tipArea = StarButtonTip:create()
	self.tipArea:setPosition(ccp(120, 0))
	self.tipArea:setVisible(false)
	self:addChild(self.tipArea)

	local function onTouchBegin(event)
		self:onTouchBegin(event)
	end

	local function onTouchEnd(event)
		self:onTouchEnd(event)
	end

	local function onTouchTap( event )
		-- body
		self:onTouchTap(event)
	end

	self.ui:setTouchEnabled(true, 0, true)
	self.ui:addEventListener(DisplayEvents.kTouchBegin, onTouchBegin)
	self.ui:addEventListener(DisplayEvents.kTouchEnd, onTouchEnd)
	self.ui:addEventListener(DisplayEvents.kTouchTap, onTouchTap)
end

function StarButton:addLayerColorWrapper(ui,anchorPoint)
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
    uiParent:addChildAt(layer, index)

    return layer
end

function StarButton:onTouchBegin(event)

	self.isTipShown = false
	local function longtimeTouch( ... )
		-- body
		local normalTotalStar = UserManager:getInstance():getFullStarInOpenedRegionInclude4star()
		local hiddenTotalStar = MetaModel.sharedInstance():getFullStarInOpenedHiddenRegion()

		if hiddenTotalStar > 0 then
			self.tipArea:setContent(self.normalStar, self.hiddenStar, normalTotalStar, hiddenTotalStar)
			self.tipArea:setVisible(true)
			GamePlayMusicPlayer:playEffect(GameMusicType.kClickBubble)
		end

		self.isTipShown = true
	end
	
	self.longtimeScheduleScriptFuncID = setTimeOut(longtimeTouch, 1)
	
	-- local metaModel = MetaModel:sharedInstance()
	-- local branchList = metaModel:getHiddenBranchDataList()
	-- local panel = HiddenBranchIntroductionPanel:create()
	-- PopoutQueue:sharedInstance():push(panel)
end

function StarButton:onTouchEnd(event)
	self.tipArea:setVisible(false)
	if self.longtimeScheduleScriptFuncID then
		cancelTimeOut(self.longtimeScheduleScriptFuncID)
		self.longtimeScheduleScriptFuncID = nil
	end
end

function StarButton:onTouchTap( event )
	-- body
	if not self.isTipShown then
		DcUtil:UserTrack({
			category = "ui",
			sub_category = "click_star_button",
		},true)
		-- local function popoutPanel()
		-- 	local panel = QuickSelectLevelPanel:create()
		-- 	panel:popout()
		-- end
		-- AsyncLoader:getInstance():waitingForLoadComplete(popoutPanel)

		-- 2016-03-02 new entry for star achevement and reward
		local function popoutPanel()
			local panel = StarAchievenmentPanel:create()
			panel:popout()
		end
		AsyncLoader:getInstance():waitingForLoadComplete(popoutPanel)
		self:stopHasNotificationAnim()
	end
end



function StarButton:positionLabel(...)
	assert(#{...} == 0)

	local numeratorSize = self.numerator:getContentSize()

	self.numerator:setPositionX(self.numeratorPhPos.x +  self.numeratorPhSize.width - numeratorSize.width)
	self.numerator:setPositionY(self.numeratorPhPos.y)

	self.separator:setPositionX(self.separatorPhPos.x) 
	self.separator:setPositionY(self.separatorPhPos.y)

	self.denominator:setPositionX(self.denominatorPhPos.x)
	self.denominator:setPositionY(self.denominatorPhPos.y)


	-- Manual Adjust Pos
	local manualAdjustNumeratorPosX = -4
	local manualAdjustNumeratorPosY = -2

	local manualAdjustSeparatorPosX = -12	-- Change This
	local manualAdjustSeparatorPosY = -12
	local manualAdjustDenominatorPosX = -8
	local manualAdjustDenominatorPosY = -11	-- Change This

	local curNumeratorPos 	= self.numerator:getPosition()
	local curSeparatorPos 	= self.separator:getPosition()
	local curDenominatorPos	= self.denominator:getPosition()

	if self.displayedN > 1000 or self.displayedD > 1000 then
		self.numerator:setScale(0.8)
		self.separator:setScale(0.8)
		self.denominator:setScale(0.8)

		manualAdjustNumeratorPosX = 6
		manualAdjustNumeratorPosY = -4

		manualAdjustSeparatorPosX = -13
		manualAdjustSeparatorPosY = -12

		manualAdjustDenominatorPosX = -11
		manualAdjustDenominatorPosY = -11

	end

	self.numerator:setPosition(ccp(curNumeratorPos.x + manualAdjustNumeratorPosX, curNumeratorPos.y + manualAdjustNumeratorPosY))
	self.separator:setPosition(ccp(curSeparatorPos.x + manualAdjustSeparatorPosX, curSeparatorPos.y + manualAdjustSeparatorPosY))
	self.denominator:setPosition(ccp(curDenominatorPos.x + manualAdjustDenominatorPosX, curDenominatorPos.y + manualAdjustDenominatorPosY))
end

function StarButton:setNormalStar(normalStar, ...)
	assert(normalStar)
	assert(#{...} == 0)

	local changed = false
	if self.normalStar ~= normalStar then
		changed = true
	end 
	self.normalStar = normalStar
	return changed
end

function StarButton:setHiddenStar(hiddenStar, ...)
	assert(hiddenStar)
	assert(#{...} == 0)

	local changed = false
	if self.hiddenStar ~= hiddenStar then
		changed = true
	end
	self.hiddenStar = hiddenStar
	return changed
end

function StarButton:setTotalStar(totalStar, ...)
	assert(totalStar)
	assert(#{...} == 0)

	local changed = false
	if self.totalStar ~= totalStar then
		changed = true
	end
	self.totalStar = totalStar
	return changed
end

function StarButton:updateView(...)
	assert(#{...} == 0)

	self:setNormalStar(UserManager:getInstance().user:getStar())
	self:setHiddenStar(UserManager:getInstance().user:getHideStar())
	self:setTotalStar(UserManager:getInstance():getFullStarInOpenedRegionInclude4star() + MetaModel.sharedInstance():getFullStarInOpenedHiddenRegion())

	local n = self.normalStar + self.hiddenStar
	local d = self.totalStar

	if (not PlatformConfig:isQQPlatform()) then 
		self:updateShine()
	end

	if self.displayedN == n and
		self.displayedD == d then
		return
	end

	self.displayedN = n
	self.displayedD = d

	self.numerator:setString(tostring(n))
	self.denominator:setString(tostring(d))

	self:positionLabel()

	print("curNumber: " .. n)
	print("totalNumber: " .. d)

	self.progressBar:setCurNumber(n)
	self.progressBar:setTotalNumber(d)
end

-- 有可以领取的星星奖励，闪起来！
function StarButton:updateShine()
	local show = self:hasStarReward()
	self.shineAnim:setVisible(show)

	self.shineAnim:stopAllActions()
	self.shineAnim:setScale(1.10)
	     
	IconButtonManager:getInstance():removePlayTipActivityIcon(self)

	if show then 
		-- self.shineAnim:runAction(CCScaleTo:create(0.2, 1.7))
		self.shineAnim:runAction(CCRepeatForever:create(CCRotateBy:create(0.1, 9)))

		self.idPre = "StarButton"
		-- self["tip"..IconTipState.kNormal] = 
	    local tips = Localization:getInstance():getText("mystar_getbutton_yes")
	    self.id = self.idPre .. self.tipState
	    if tips then 
	        self:setTipPosition(IconButtonBasePos.RIGHT)
	        self:setTipString(tips)
	        IconButtonManager:getInstance():addPlayTipActivityIcon(self)
	        -- self:playHasNotificationAnim()
	    end
	end
end


-- 是否有可以领取的奖励
function StarButton:hasStarReward()
	self.curTotalStar 	= UserManager:getInstance().user:getTotalStar()

	local nearestStarRewardLevelMeta	= MetaManager.getInstance():starReward_getRewardLevel(self.curTotalStar)
	local nextRewardLevelMeta		= MetaManager.getInstance():starReward_getNextRewardLevel(self.curTotalStar)
	local rewardLevelToPushMeta 		= false
	local needStarNum = 0

	if nearestStarRewardLevelMeta then
		local rewardLevelToPush = UserManager:getInstance().userExtend:getFirstNotReceivedRewardLevel(nearestStarRewardLevelMeta.id)

		if rewardLevelToPush then
			-- Has Reward Level
			rewardLevelToPushMeta = MetaManager.getInstance():starReward_getStarRewardMetaById(rewardLevelToPush)
			needStarNum = rewardLevelToPushMeta.starNum
		else
			-- All Reward Level Has Received
		end
	end

	if not rewardLevelToPushMeta then
		-- If Has Next Reward Level, Show It
		if nextRewardLevelMeta then
			rewardLevelToPushMeta = nextRewardLevelMeta
			needStarNum = rewardLevelToPushMeta.starNum
		end
	end
	-- print("[shine]",rewardLevelToPushMeta,self.curTotalStar,rewardLevelToPushMeta.starNum)
	if rewardLevelToPushMeta  and self.curTotalStar >= rewardLevelToPushMeta.starNum then
		return true,self.curTotalStar - needStarNum,rewardLevelToPushMeta
	end

	return false,self.curTotalStar - needStarNum,rewardLevelToPushMeta
end

function StarButton:playChangeTotalStarAnim(numChangeStar)
	local originSize = self.denominator:getContentSize()
	local enlargeAction = EnlargeRestore:create(self.denominator, originSize, 1.4, 0.1, 0.3)
	self.denominator:runAction(enlargeAction)

	local fntFile = "fnt/hud.fnt"
	local changeLabel = LabelBMMonospaceFont:create(self.denominator.charWidth, self.denominator.charHeight, self.denominator.charInterval, self.denominator.fntFile)
	changeLabel:setString("+" .. numChangeStar)
	changeLabel:setPositionX(self.denominatorPhPos.x + 10)
	changeLabel:setPositionY(self.denominatorPhPos.y - 20)
	self:addChild(changeLabel)

	local function removeChangeLabel()
		changeLabel:stopAllActions()
		changeLabel:removeFromParentAndCleanup(true)
	end

	local fadeInAction = CCFadeIn:create(0.1)
	local delayAction = CCDelayTime:create(0.3)
	local fadeOutAction = CCFadeOut:create(0.1)
	local fadeActionList = CCArray:create()
	fadeActionList:addObject(fadeInAction)
	fadeActionList:addObject(delayAction)
	fadeActionList:addObject(fadeOutAction)
	local fadeSequence = CCSequence:create(fadeActionList)

	local moveAction = CCMoveBy:create(0.5, ccp(0, 30))
	local deleteAction = CCCallFunc:create(removeChangeLabel)
	local moveActionList = CCArray:create()
	moveActionList:addObject(moveAction)
	moveActionList:addObject(deleteAction)
	local moveSequence = CCSequence:create(moveActionList)

	changeLabel:runAction(CCSpawn:createWithTwoActions(fadeSequence, moveSequence))
end

function StarButton:playBubbleSkewAnim(...)
	assert(#{...} == 0)

	self.bubbleItem:playBubbleSkewAnim()
end

function StarButton:playHighlightAnim(...)
	assert(#{...} == 0)

	local itemRes	= ResourceManager:sharedInstance():buildSprite("starHighlightWrapper")
	self.bubbleItem:playHighlightAnim(itemRes)
end

-- 不行啊。。
function StarButton:playEntireHighlightAnim(...)
	-- if not self.shineAnim then
		local bubble = self:getBubbleItemRes():getChildByName("bubble")
		self.shine = Sprite:createWithSpriteFrameName("bubbleShine0000")
		self.shine:setAnchorPoint(ccp(0,0))
		self.shine:setPositionX(-8)
		self.shine:setPositionY(-8)
		bubble:addChild(self.shine)
	-- end

	self.shine:stopAllActions()
	self.shine:setOpacity(0)
	self.shine:setVisible(true)
	local actions = CCArray:create()
	actions:addObject(CCFadeTo:create(5/24,150/150 * 255))
	actions:addObject(CCFadeTo:create(5/24,100/150 * 255))
	actions:addObject(CCFadeTo:create(4/24,0/150 * 255))
	actions:addObject(CCCallFunc:create(function( ... )
		self.shine:setVisible(false)
	end))
	self.shine:runAction(CCSequence:create(actions))

	local icon = self:getBubbleItemRes():getChildByName("placeHolder")
	iconBounds = icon:getGroupBounds()

	local animIcon = Sprite:createWithSpriteFrame(icon:getChildAt(0):displayFrame())
	animIcon:setAnchorPoint(ccp(0.5,0.5))
	local pos = self:convertToNodeSpace(ccp(iconBounds:getMidX(),iconBounds:getMidY()))
	animIcon:setPositionX(pos.x)
	animIcon:setPositionY(pos.y)
	self:addChild(animIcon)

	local actions = CCArray:create()
	actions:addObject(CCScaleTo:create(2/24,0.9,0.9))
	actions:addObject(CCSpawn:createWithTwoActions(
		CCScaleTo:create(6/24,1.3,1.3),
		CCFadeTo:create(6/24,0.55)
	))
	actions:addObject(CCSpawn:createWithTwoActions(
		CCScaleTo:create(5/24,1.0,1.0),
		CCFadeTo:create(5/24,1.0)
	))
	actions:addObject(CCCallFunc:create(function( ... )
		animIcon:removeFromParentAndCleanup(true)
	end))
	animIcon:runAction(CCSequence:create(actions))

end



function StarButton:create(...)
	assert(#{...} == 0)

	local newStarButton = StarButton.new()
	newStarButton:init()
	return newStarButton
end

function StarButton:onAddToStage( ... )
	-- body
	self.ui:setTouchEnabled(true, 0, true)
	self:onTouchEnd()
end

function StarButton:getBubbleItemRes( ... )
	return self.blueBubbleItemRes
end