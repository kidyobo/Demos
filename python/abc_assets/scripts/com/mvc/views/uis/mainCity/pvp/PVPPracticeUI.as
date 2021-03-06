package com.mvc.views.uis.mainCity.pvp
{
   import starling.display.Sprite;
   import lzm.starling.swf.Swf;
   import lzm.starling.swf.display.SwfSprite;
   import lzm.starling.swf.display.SwfButton;
   import starling.text.TextField;
   import com.common.managers.LoadSwfAssetsManager;
   import com.common.util.GetCommon;
   import com.mvc.models.vos.elf.ElfVO;
   
   public class PVPPracticeUI extends Sprite
   {
       
      private var swf:Swf;
      
      public var spr_practice:SwfSprite;
      
      public var prepareBtn:SwfButton;
      
      public var cancelPrepareBtn:SwfButton;
      
      public var beginPlayBtn:SwfButton;
      
      public var fightRulesBtn:SwfButton;
      
      public var backBtn:SwfButton;
      
      public var removeNPCBtn:SwfButton;
      
      public var lineupBtn:SwfButton;
      
      public var bagBtn:SwfButton;
      
      public var myPointTf:TextField;
      
      public var myTotalFightTf:TextField;
      
      public var myOddsTf:TextField;
      
      public var myNameTf:TextField;
      
      public var myTopRankTf:TextField;
      
      public var myNowRankTf:TextField;
      
      public var myStateTf:TextField;
      
      public var npcPointTf:TextField;
      
      public var npcTotalFightTf:TextField;
      
      public var npcOddsTf:TextField;
      
      public var npcNameTf:TextField;
      
      public var npcTopRankTf:TextField;
      
      public var npcNowRankTf:TextField;
      
      public var npcStateTf:TextField;
      
      public var roomNumTf:TextField;
      
      public var roomNameTf:TextField;
      
      public var myElfCamp:com.mvc.views.uis.mainCity.pvp.PVPElfCampUI;
      
      public var npcElfCamp:com.mvc.views.uis.mainCity.pvp.PVPElfCampUI;
      
      public var npcNameSpr:Sprite;
      
      public var myNameSpr:Sprite;
      
      public function PVPPracticeUI()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         swf = LoadSwfAssetsManager.getInstance().assets.getSwf("pvp");
         spr_practice = swf.createSprite("spr_practice");
         addChild(spr_practice);
         prepareBtn = spr_practice.getChildByName("prepareBtn") as SwfButton;
         cancelPrepareBtn = spr_practice.getChildByName("cancelPrepareBtn") as SwfButton;
         beginPlayBtn = spr_practice.getChildByName("beginPlayBtn") as SwfButton;
         fightRulesBtn = spr_practice.getChildByName("fightRulesBtn") as SwfButton;
         backBtn = spr_practice.getChildByName("backBtn") as SwfButton;
         removeNPCBtn = spr_practice.getChildByName("removeNPCBtn") as SwfButton;
         lineupBtn = spr_practice.getChildByName("lineupBtn") as SwfButton;
         bagBtn = spr_practice.getChildByName("bagBtn") as SwfButton;
         myPointTf = spr_practice.getChildByName("myPointTf") as TextField;
         myTotalFightTf = spr_practice.getChildByName("myTotalFightTf") as TextField;
         myOddsTf = spr_practice.getChildByName("myOddsTf") as TextField;
         myNameSpr = new Sprite();
         myNameSpr.x = 119;
         myNameSpr.y = 343;
         spr_practice.addChild(myNameSpr);
         myStateTf = spr_practice.getChildByName("myStateTf") as TextField;
         myTopRankTf = spr_practice.getChildByName("myTopRankTf") as TextField;
         myNowRankTf = spr_practice.getChildByName("myNowRankTf") as TextField;
         npcPointTf = spr_practice.getChildByName("npcPointTf") as TextField;
         npcTotalFightTf = spr_practice.getChildByName("npcTotalFightTf") as TextField;
         npcOddsTf = spr_practice.getChildByName("npcOddsTf") as TextField;
         npcNameTf = spr_practice.getChildByName("npcNameTf") as TextField;
         npcNameTf.text = "";
         npcNameSpr = new Sprite();
         npcNameSpr.x = 815;
         npcNameSpr.y = 343;
         spr_practice.addChild(npcNameSpr);
         showName(npcNameSpr,"？？？？？？",0);
         npcStateTf = spr_practice.getChildByName("npcStateTf") as TextField;
         npcTopRankTf = spr_practice.getChildByName("npcTopRankTf") as TextField;
         npcNowRankTf = spr_practice.getChildByName("npcNowRankTf") as TextField;
         roomNumTf = spr_practice.getChildByName("roomNumTf") as TextField;
         roomNumTf.autoScale = true;
         roomNameTf = spr_practice.getChildByName("roomNameTf") as TextField;
         roomNameTf.autoScale = true;
      }
      
      public function showName(param1:Sprite, param2:String, param3:int) : void
      {
         var _loc6_:* = null;
         param1.removeChildren(0,-1,true);
         var _loc4_:TextField = new TextField(50,30,"","1",25,5715238,true);
         _loc4_.autoSize = "horizontal";
         _loc4_.text = param2;
         var _loc5_:* = 240;
         if(_loc5_ - _loc4_.width < 80)
         {
            _loc5_ = _loc4_.width + 80;
         }
         _loc4_.x = _loc5_ - _loc4_.width >> 1;
         _loc4_.y = 42 - _loc4_.height >> 1;
         param1.addChild(_loc4_);
         if(param3 > 0)
         {
            _loc6_ = GetCommon.getVipIcon(param3);
            _loc6_.x = _loc4_.x - _loc6_.width - 5;
            param1.addChild(_loc6_);
         }
      }
      
      public function showMyElfCamp(param1:Vector.<ElfVO>) : void
      {
         if(!myElfCamp)
         {
            myElfCamp = new com.mvc.views.uis.mainCity.pvp.PVPElfCampUI(param1);
         }
         else
         {
            myElfCamp.removeFromParent(true);
            myElfCamp = null;
            myElfCamp = new com.mvc.views.uis.mainCity.pvp.PVPElfCampUI(param1);
         }
         myElfCamp.x = 125;
         myElfCamp.y = 395;
         spr_practice.addChild(myElfCamp);
      }
      
      public function showNPCElfCamp(param1:Vector.<ElfVO>, param2:Boolean = false) : void
      {
         if(!npcElfCamp)
         {
            npcElfCamp = new com.mvc.views.uis.mainCity.pvp.PVPElfCampUI(param1,param2);
         }
         else
         {
            npcElfCamp.removeFromParent(true);
            npcElfCamp = null;
            npcElfCamp = new com.mvc.views.uis.mainCity.pvp.PVPElfCampUI(param1,param2);
         }
         npcElfCamp.x = 825;
         npcElfCamp.y = 395;
         spr_practice.addChild(npcElfCamp);
      }
   }
}
