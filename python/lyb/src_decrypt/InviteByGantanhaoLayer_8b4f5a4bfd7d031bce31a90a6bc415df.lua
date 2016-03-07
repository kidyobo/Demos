--[[
  Copyright @2009-2013 www.happyelements.com, all rights reserved.
  Create date: 2013-4-15

  yanchuan.xie@happyelements.com
]]

require "main.view.buddy.ui.buddyPopup.InviteByGantanhaoItem";

InviteByGantanhaoLayer=class(Layer);

function InviteByGantanhaoLayer:ctor()
  self.class=InviteByGantanhaoLayer;
end

function InviteByGantanhaoLayer:dispose()
  self:removeAllEventListeners();
  self:removeChildren();
  InviteByGantanhaoLayer.superclass.dispose(self);
  self.armature4dispose:dispose();
end

function InviteByGantanhaoLayer:initialize(container_parent)
  self:initLayer();
  self.skeleton=getSkeletonByName("buddy_ui");
  self.container_parent=container_parent;
  self.buddyListProxy=self.container_parent.buddyListProxy;
  self.const_item_num=4.3;
  self.items={};

  local bg=LayerColorBackGround:getTransBackGround();
  --bg:addEventListener(DisplayEvents.kTouchTap,self.onSelfTap,self);
  self:addChild(bg);

  --骨骼
  local armature=self.skeleton:buildArmature("invite_by_gantanhao_panel");
  armature.animation:gotoAndPlay("f1");
  armature:updateBonesZ();
  armature:update();
  self.armature4dispose=armature;
  self.armature=armature.display;
  self.armature:setPositionXY(225,89);
  self:addChild(self.armature);

  local text="      好友           等级             操作";
  self.descb=createTextFieldWithTextData(armature:getBone("title_descb").textData,text);
  self.armature:addChild(self.descb);

  -- self.commend_button=Button.new(armature:findChildArmature("common_copy_bluelonground_button"),false);
  -- self.commend_button.bone:initTextFieldWithString("common_copy_bluelonground_button","全部同意");
  -- self.commend_button:addEventListener(Events.kStart,self.onButtonTap,self);

  -- self.commend_button=Button.new(armature:findChildArmature("common_copy_greenlongroundbutton"),false);
  -- self.commend_button.bone:initTextFieldWithString("common_copy_bluelonground_button","全部拒绝");
  -- self.commend_button:addEventListener(Events.kStart,self.onButton_1Tap,self);

  -- self.close_button=Button.new(armature:findChildArmature("tip_close_button"),false);
  -- self.close_button:addEventListener(Events.kStart,self.onSelfTap,self);

  local closeButton =self.armature4dispose.display:getChildByName("close_button");
  SingleButton:create(closeButton);
  closeButton:addEventListener(DisplayEvents.kTouchTap, self.onSelfTap, self);

  self.listScrollViewLayer=FlexibleListScrollViewLayer.new();
  self.listScrollViewLayer:initLayer();
  self.listScrollViewLayer:setViewSize(makeSize(465,400));
  self.listScrollViewLayer:setPositionXY(15,130);
  self.armature:addChild(self.listScrollViewLayer);

  -- local close_button=CommonButton.new();
  -- close_button:initialize("common_close_button_normal","common_close_button_down",CommonButtonTouchable.BUTTON);
  -- close_button:setPosition(ccp(405,525));
  -- close_button:addEventListener(DisplayEvents.kTouchTap,self.onSelfTap,self);
  -- self.armature:addChild(close_button);
  local button=self.armature:getChildByName("agree_button");
  local button_pos=convertBone2LB4Button(button);
  self.armature:removeChild(button);

  button=CommonButton.new();
  button:initialize("commonButtons/common_blue_button_normal","commonButtons/common_blue_button_down",CommonButtonTouchable.BUTTON);
  --button:initializeText(trimButtonData,"整理背包");
  button:initializeBMText("全部同意","anniutuzi");
  button:setPosition(button_pos);
  button:addEventListener(DisplayEvents.kTouchTap,self.onButtonTap,self);
  self.armature:addChild(button);

  button=self.armature:getChildByName("reject_button");
  button_pos=convertBone2LB4Button(button);
  self.armature:removeChild(button);

  button=CommonButton.new();
  button:initialize("commonButtons/common_blue_button_normal","commonButtons/common_blue_button_down",CommonButtonTouchable.BUTTON);
  --button:initializeText(trimButtonData,"整理背包");
  button:initializeBMText("全部拒绝","anniutuzi");
  button:setPosition(button_pos);
  button:addEventListener(DisplayEvents.kTouchTap,self.onButton_1Tap,self);
  self.armature:addChild(button);

  local size=Director:sharedDirector():getWinSize();
  local popupSize=self.armature:getChildByName("bg"):getContentSize();
  self.armature:setPositionXY((size.width-popupSize.width)/2,(size.height-popupSize.height)/2);
  self:initializeData();
end

function InviteByGantanhaoLayer:onButtonTap(event)
  for k,v in pairs(self.items) do
    if self.buddyListProxy:getBuddyNumFull() then
      sharedTextAnimateReward():animateStartByString("好友达到上限了啦！");
      return;
    end
    v:onOperate_1Tap();
  end
  self:onSelfTap();
end

function InviteByGantanhaoLayer:onButton_1Tap(event)
  for k,v in pairs(self.items) do
    v:onOperate_2Tap();
  end
  self:onSelfTap();
end

function InviteByGantanhaoLayer:onSelfTap(event)
  if self.parent then
    self.parent:removeChild(self);
    self.container_parent:refreshBuddyCommendButton();
  end
end

function InviteByGantanhaoLayer:onItemTap()
  for k,v in pairs(self.items) do
    if not v.selected then
      return;
    end
  end
  self:onSelfTap();
end

function InviteByGantanhaoLayer:initializeData()
  local gantanhaos=self.container_parent.buddyListProxy:getGantanhaos();
  for k,v in pairs(gantanhaos) do
    local a=InviteByGantanhaoItem.new();
    a:initialize(self.skeleton,self.container_parent,v,self);
    self.listScrollViewLayer:addItem(a);
    table.insert(self.items,a);
  end
end