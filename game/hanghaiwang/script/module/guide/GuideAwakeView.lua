-- FileName: GuideAwakeView.lua
-- Author: huxiaozhou
-- Date: 2015-01-08
-- Purpose: 伙伴觉醒引导
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--         		佛祖保佑  需求不变  
--		   		不怕出bug  最恨改需求
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- /


module("GuideAwakeView", package.seeall)

guideStep = 0
-- 模块局部变量 --
local m_fnGetWidget = g_fnGetWidgetByName
local m_mainWidget = nil


local function init(...)

end

function destroy(...)
	package.loaded["GuideAwakeView"] = nil
end

function moduleName()
    return "GuideAwakeView"
end

function create(step, opacity, pos, callfunc)
	guideStep = step
	local json = "ui/new_awake.json"
	m_mainWidget = g_fnLoadUI(json)
	m_mainWidget:setSize(g_winSize)
	local LAY_MAIN = m_fnGetWidget(m_mainWidget,"LAY_MAIN")
	

	local count = LAY_MAIN:getChildren():count()
	local LAY_NOMASK1
	local worldPosTemp = nil
	local rectTemp1 = nil

	logger:debug("LAY_AWAKE_STEP" .. step)
	logger:debug("count".. count)

	for i=1,count do
		local layKeyName = "LAY_AWAKE_STEP" .. i
		local lay_ship_step = m_fnGetWidget(m_mainWidget,layKeyName)

		if(tonumber(step) == i) then
			if i~=5 and i~= 4 then
				logger:debug("step = %s", step)
				logger:debug("i = %s", i)
				LAY_NOMASK1 = m_fnGetWidget(lay_ship_step, "LAY_NOMASK" .. step)
			end

				-- 副本地图 特殊处理
			if (i == 8) then
				local LAY_SCALEY = m_fnGetWidget(lay_ship_step, "LAY_SCALEY")
				LAY_SCALEY:setScale(g_winSize.height/1136)
			end

		else
			lay_ship_step:setVisible(false)
		end
	end
	--创建mask layer
	local touchCallback = callfunc 
	local priority = g_tbTouchPriority.guide
	local layer
	if (not touchCallback) then

		local rectTemp = rectTemp1 or CCSizeMake(LAY_NOMASK1:getSize().width,LAY_NOMASK1:getSize().height)

		local worldPos = worldPosTemp or LAY_NOMASK1:convertToWorldSpace(ccp(0,0))
		local  tempPos = pos or worldPos
		logger:debug("tempPos.x = %f, tempPos.y = %f", tempPos.x, tempPos.y)
		local touchRect = CCRectMake(tempPos.x-rectTemp.width*.5, tempPos.y-rectTemp.height*.5, rectTemp.width,rectTemp.height)

		-- local touchRect = CCRectMake(worldPos.x-rectTemp.width*.5, worldPos.y-rectTemp.height*.5, rectTemp.width,rectTemp.height)
		local layerOpacity = opacity or 150
		local highRect = touchRect--LAY_NOMASK1:boundingBox()
		layer = UIHelper.createMaskLayer( priority,touchRect ,nil, layerOpacity,highRect)
		layer:addChild(m_mainWidget)
	else
		layer = UIHelper.createMaskLayer( priority,nil,touchCallback, layerOpacity,nil)
		layer:addChild(m_mainWidget)
	end

	
	return layer
end