--[[
	Copyright @2009-2013 www.happyelements.com, all rights reserved.
	Create date: 2013-4-17

	yanchuan.xie@happyelements.com
]]

HeroPutOnEquipeCommand=class(Command);

function HeroPutOnEquipeCommand:ctor()
	self.class=HeroPutOnEquipeCommand;
end

function HeroPutOnEquipeCommand:execute(notification)
	-- local heroHouseProxy = self:retrieveProxy(HeroHouseProxy.name);
	-- if not heroHouseProxy.init then
	local data=notification:getData();
		sendMessage(6,6,data);
	-- end;
end