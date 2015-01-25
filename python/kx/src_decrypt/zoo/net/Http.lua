-------------------------------------------------------------------------
--  Class include: DefaultResponseHandler, HttpBase
-------------------------------------------------------------------------
require "hecore.rpc"
require "hecore.EventDispatcher"

require "zoo.config.NetworkConfig"

require "zoo.data.UserManager"
require "zoo.data.FriendManager"

require "zoo.net.LevelType"

require "zoo.net.UserLocalLogic"
require "zoo.net.ItemLocalLogic"
require "zoo.net.LoginLocalLogic"
require "zoo.net.DailyDataLocalLogic"
require "zoo.net.UserService"
require "zoo.net.Localhost"

require "zoo.net.CheckNetwork"

kHttpEndPoints = table.const {
--online mode, no data need to sync to server from local
	login = "login", getUser = "getUser", --only used for exception panel.
	friends = "friend", 
	getLevelScoreRank="getLevelScoreRank", getLevelTop="getLevelTop",
	getUnLockFriend = "getUnLockFriend",
	queryUser = "queryUser",
  requestFriend = "requestFriend", getFriends = "getFriends",
	startLadyBugTask	= "startLadyBugTask",
	endLadyBugTask		= "endLadyBugTask",
	finishChildLadyBugTask	= "finishChildLadyBugTask",
	getInviteFriendsInfo	= "getInviteFriendsInfo",
	updateUserGuideStep = "updateUserGuideStep",
  respRequest = "respRequest",
  newUserEnergy = "newUserEnergy",
  getLeftAskInfos = "getLeftAskInfos",
  getRequestNum = "getRequestNum",
  getRequestInfos = "getRequestInfos",
  ignoreFreegift = "ignoreFreegift",
  getNearby = "getNearby",
  sendLocation = "sendLocation",
  getMatchs = "getMatchs", confirmMatch = "confirmMatch", ackMatch = "ackMatch",
  inviteFriends = "inviteFriends",
  queryQihooOrder = "queryQihooOrder",
  updateConfigFromServer = "updateConfigFromServer",
  syncSnsFriend = "syncSnsFriend",
  getPromStatus = 'getPromStatus',
  getPromReward = 'getPromReward',
  clickProm = 'clickProm',
  getFruitsInfo = "getFruitsInfo",
  upgradeFruitTree = "upgradeFruitTree",
  getPassNum = "getPassNum",
  getShareRank = "getShareRank",
  getCompenInfo = "getCompenInfo",
  doPaymentOrder = "doPaymentOrder",
  doWXPaymentOrder = "doWXPaymentOrder",
  doAliPaymentOrder = "doAlipayOrder",
  getRewards = "getRewards",
  clickActivity = "clickActivity",
  mergeConnect  = "mergeConnect",
  GetIAPCodeInitInfo =  "iapInfo",
  getCashLogs = "getCashLogs",
  GetIAPExchangeCode = "getIapCode",

--online mode, user data/prop/scores will sync from local to server
	mark = "mark", --will change props.
	sellProps="sellProps",  -- will change coin/cash, props
	unLockLevelArea="unLockLevelArea", --require sync top level
	buy="buy", -- require sync props
	getStarRewards	= "getStarRewards", -- change props
	getLadyBugRewards	= "getLadyBugRewards", --change props
	getInviteFriendsReward	= "getInviteFriendsReward", -- change props
  updateProfile = "updateProfile", --change user name,head image
  confirmInvite = "confirmInvite", -- Usef For Invite Code
  sendFreegift = "sendFreegift", -- change props
  acceptFreegift = "acceptFreegift", -- change props
  getExchangeCodeReward = "getExchangeCodeReward",
  deleteFriend = 'deleteFriend',
  getInviteeReward = 'getInviteeReward',
  getUpdateReward = 'getUpdateReward',
  pickFruit = "pickFruit", -- add props
  getCompenReward = "getCompenReward", -- add prop
  getWeekMatchData = "getWeekMatchDatas",
  getCommonRankList = "getCommonRankList",
  exchangeWeekMatchItems = "exchangeWeekMatchItems",
  receiveWeekMatchRewards = "receiveWeekMatchRewards",
  cnValentineInfo = "cnValentineInfo",
  cnValentineExchange = "cnValentineExchange",
  wxShare = "wxShare",
  turnTable = "turnTable",
  pushNotify = "pushNotify",
  getRabbitMatchDatas = "getRabbitMatchDatas",
  receiveRabbitMatchRewards = "receiveRabbitMatchRewards",
  opNotify = "opNotify",
  levelConfigUpdate = "levelConfigUpdate",

--offline mode
	startLevel = "startlevel", 
  passLevel = "passLevel", 
  useProps="useProps", 
  openGiftBlocker="openGiftBlocker", 
  ingame = "ingame",
  getNewUserRewards = "getNewUserRewards",
  oneplusReward = "oneplusReward",
}

kErrorCodeRange = 730000
ZooErrorCode = table.const {
    kDefaultError = -1,
    kNetworkError = -2,
    kTimeoutError = -3,
    kServerError = -4,
    INVALID_PARAMS = -5,
    kNotLoginError = -6,

    INVALID_SESSION_KEY = 206 + kErrorCodeRange,
    CONFIG_ERROR = 209 + kErrorCodeRange,

    LEVEL_ID_INVALID = 601 + kErrorCodeRange,
    LEVEL_ID_INVALID_START_LEVEL = 602 + kErrorCodeRange,
    ENERGY_NOT_ENOUGH = 326 + kErrorCodeRange,
    USE_ENERY_PLUS_PROP_ERROR_ENERGY_PLUS_ERROR = 319 + kErrorCodeRange,
    USE_ENERY_PLUS_PROP_ERROR = 318 + kErrorCodeRange,
    COIN_NOT_ENOUGH = 321 + kErrorCodeRange,
    EXP_NOT_ENOUGH = 322 + kErrorCodeRange,
    POINT_NOT_ENOUGH = 325 + kErrorCodeRange,
    ENERGY_NOT_ENOUGH = 326 + kErrorCodeRange,
    CASH_NOT_ENOUGH = 330 + kErrorCodeRange,
    USE_PROP_LEVEL_ERROR = 316 + kErrorCodeRange,
    PROP_NOT_ENOUGH = 311 + kErrorCodeRange,
    LEVEL_INVALID_REQUEST_TIME = 603 + kErrorCodeRange,
    DECO_NOT_ENOUGH = 621 + kErrorCodeRange,
    FUNC_NOT_ENOUGH = 611 + kErrorCodeRange,
    ITEM_TYPE_NOT_SUPPORT = 470 + kErrorCodeRange,
    ADD_PROP_MODE_ERROR_START_LEVEL = 313 + kErrorCodeRange,
    DIGGER_MATCH_ERROR_REACH_MAX_COUNT_ERROR = 734 + kErrorCodeRange,
    HIDE_AREA_ERROR_AREA_UNLOCK = 701 + kErrorCodeRange,
    BUY_WRONG_MONEY_TYPE = 393 + kErrorCodeRange,
    WEEK_MATCH_ERROR_MATCH_NOT_AVAILABLE = 773 + kErrorCodeRange,
    WEEK_MATCH_ERROR_LEVEL_INVALID = 774 + kErrorCodeRange,
    WEEK_MATCH_ERROR_DAILY_LIMIT = 775 + kErrorCodeRange,
    QIXI_NOT_ENOUGH_PLAY = 999 + kErrorCodeRange, -- todo test

}

--
-- DefaultResponseHandler ---------------------------------------------------------
--
local DefaultResponseHandler = class()

function DefaultResponseHandler:ctor(endpoints, errors)
  self.endpoints = endpoints
  self.errors = errors
end

function DefaultResponseHandler:handleError(endpoints, err)
  he_log_warning("default handleError, err: " .. err .. ", endpoints: " .. table.tostring(endpoints))
end

function DefaultResponseHandler:handleResponse(endpoint, data)
  he_log_info("default handleResponse for " .. endpoint)
end

--
-- ConnectionManager ---------------------------------------------------------
--
ConnectionManager = class()
local loader = ConnectionManager.new()
local isConnectionManagerInitialized = 0
function ConnectionManager:reset( userId, sessionKey )
  if isConnectionManagerInitialized == 0 then 
    isConnectionManagerInitialized = 1
    ConnectionManager:initialize(userId, sessionKey)
  else ConnectionManager:changeUserID(userId, sessionKey) end
end
function ConnectionManager:initialize(uid, sessionKey)
	assert(uid and sessionKey, "uid and sessionKey should not be nil")
	local appId = StartupConfig:getInstance():getGspAppId()
  local language = "zh_CN"
  local pf = StartupConfig:getInstance():getPlatformName()
  if not pf then pf = "hex" end
  if __IOS_FB then
      language = "zh_TW"
  end

	local config = {url = NetworkConfig.rpcURL,queueSize = 10,flushInterval = 10,timeout = 6,defaultPriority = rpc.SendingPriority.kNormal}
  local sessionKeySource = function(callback) callback(UserManager.getInstance().sessionKey, os.time() + 3600)  end
  local function platformFinder() return pf end -- older value "hex"
	local transponder = rpc.RpcTransponder.new(config, sessionKeySource)
	loader.transponder = transponder

	--AssembleConvertor:ctor(amf3Enabled, version, metaVersion, appID, language, platformFinder, clientType, uk, counter, others)
	transponder:registryConvertor(
    	rpc.AssembleConvertor.new(true, _G.bundleVersion, "1.0.0", appId, language, platformFinder, 0),
    	{ rpc.CompressConvertor.new(), rpc.HeaderConvertor.new() },
    	{ rpc.PackageConvertor.new() }
  )	
	transponder:invalidateSessionKey()
  transponder:changeUID(uid)
  if not transponder:isBlocked() then transponder:flush() end
end

function ConnectionManager:invalidateSessionKey(  )
  local transponder = loader.transponder
  transponder:invalidateSessionKey()
end

function ConnectionManager:changeUserID( uid, sessionKey )
	local transponder = loader.transponder
	transponder:invalidateSessionKey()
  transponder:changeUID(uid)
end

local syncLock = false
function ConnectionManager:block()
  loader.transponder:block()
end
function ConnectionManager:flush()
  if not syncLock then loader.transponder:flush() end
end
function ConnectionManager:sendRequest( endpoint, body, callback )
  loader.transponder:call(endpoint, body, callback, rpc.SendingPriority.kHigh, false)
end
function ConnectionManager:syncBlock()
  syncLock = true
  ConnectionManager:block()
end
function ConnectionManager:syncFlush()
  syncLock = false
  ConnectionManager:flush()
end

--
-- HttpBase ---------------------------------------------------------
--
HttpBase = class(EventDispatcher)
function HttpBase:ctor(timeoutMode)
  local timeout = nil
  if timeoutMode then timeout = 1 end --display loading animation after 1 second

  local context = self
  context.timeoutID = nil
  context.timeout = timeout
  context.animation = nil
  context.isCancelRequest = false
  context.isResponsed = false

  local transponder = {}
  local function onResponse( endpoint, data, err ) 
    context.isResponsed = true
    Localhost:saveTimeDiff(__g_utcDiffSeconds)  --save time diff for local network usage
    context:onResponse(endpoint, data, err) 
  end
  transponder.call = function ( self, endpoint, data, handler, priority, isLogin )
    context.handler = handler
    if context.timeout ~= nil and type(context.timeout) == "number" then context:_startTime() end
    loader.transponder:call(endpoint, data, onResponse, priority, isLogin)
  end
  context.transponder = transponder
end
function HttpBase:dispose()
	self:_stopTime()
  self:_removeAnimation()
  self:removeAllEventListeners()
end
function HttpBase:_startTime()
  local function onCloseButtonTap( evt )
    if evt and evt.target then evt.target:rma() end
    self:_stopTime()
    self:_removeAnimation()
    self.isCancelRequest = true
    if self.cancelCallback then
      self.cancelCallback()
    end
    self:dispatchEvent(Event.new(Events.kCancel, nil, self))
  end

  local wSize = Director:sharedDirector():getWinSize()
  local scene = Director:sharedDirector():getRunningScene()
  self.layer = LayerColor:create()
  self.layer:changeWidthAndHeight(wSize.width, wSize.height)
  self.layer:setTouchEnabled(true, 0, true)
  self.layer:setOpacity(0)
  PopoutManager:sharedInstance():add(self.layer, false, false)
  -- scene:addChild(self.layer)

  local function onTimeOut()
    self:_stopTime()
    if self.layer then
      self.layer.onKeyBackClicked = function()
        onCloseButtonTap({target = self.layer})
      end
    end
    local scene = Director:sharedDirector():getRunningScene()
    if scene and self.animation == nil and self.isResponsed == false then 
      self.animation = CountDownAnimation:createNetworkAnimation(scene, onCloseButtonTap) 
    end
  end
  self.timeoutID = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(onTimeOut,self.timeout,false)
end
function HttpBase:_stopTime()
  if self.timeoutID ~= nil then CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(self.timeoutID) end
  print("HttpBase:stop timeout check")
end
function HttpBase:_removeAnimation()
  if self.animation then 
    self.animation:removeFromParentAndCleanup(true) 
    self.animation = nil
  end
  if self.layer then
    PopoutManager:sharedInstance():remove(self.layer)
    -- self.layer:removeFromParentAndCleanup(true)
    self.layer = nil
  end
end
function HttpBase:load()
end
function HttpBase:sync()
  ConnectionManager:block()
  ConnectionManager:flushCachedHttp()
end
function HttpBase:finish()
  ConnectionManager:flush()
end
function HttpBase:syncLoad(...)
  if not kUserLogin then return self:onLoadingError(ZooErrorCode.kNotLoginError) end
  local para = {...}
  ConnectionManager:block()
  SyncManager:getInstance():flushCachedHttp()
  self:load(para[1], para[2], para[3], para[4], para[5], para[6],
    para[7], para[8], para[9], para[10], para[11], para[12])
  ConnectionManager:flush()
end

local isAlerted = false
function HttpBase:onResponse( endpoint, data, err )
  if err ~= nil and err == 104 then
    --require update to new version
    if __IOS and not isAlerted then 
      isAlerted = true
      local function onUIAlertViewCallback( alertView, buttonIndex )
        isAlerted = false
        local nsURL = NSURL:URLWithString(NetworkConfig.appstoreURL)
        UIApplication:sharedApplication():openURL(nsURL)
      end
      local title = Localization:getInstance():getText("user.data.error.code.108")
      local okLabel = Localization:getInstance():getText("update.mew.vision.panel.yes")
      local UIAlertViewClass = require "zoo.util.UIAlertViewDelegateImpl"
      local alert = UIAlertViewClass:buildUI(title, "", okLabel, onUIAlertViewCallback)
      alert:show()
    end
  end

  if err ~= nil and err == 110 then
    local title = Localization:getInstance():getText("error.tip.110") 
    local okLabel = Localization:getInstance():getText("update.done.confirm")
    local function onUIAlertViewCallback( alertView, buttonIndex )
      isAlerted = false
      Director.sharedDirector():exitGame()
    end   

    if __IOS and not isAlerted then
      isAlerted = true         
      local UIAlertViewClass = require "zoo.util.UIAlertViewDelegateImpl"
      local alert = UIAlertViewClass:buildUI(title, "", okLabel, onUIAlertViewCallback)
      alert:show()
    end
    if __ANDROID then 
      AlertDialogImpl:alert( title, "", okLabel, nil, onUIAlertViewCallback, nil, onUIAlertViewCallback) 
    end
    if __WP8 then 
  		local function msgCallback(r)
        if r and onUIAlertViewCallback then 
          onUIAlertViewCallback()
        end
      end
      Wp8Utils:ShowMessageBox(title, "", msgCallback) 
    end
    return
  end

  if self.timeout then
    self:_stopTime()
    self:_removeAnimation()
    if self.handler ~= nil and self.isCancelRequest == false then self.handler(endpoint, data, err) end
  else
    self:_stopTime()
    self:_removeAnimation()
    if self.handler ~= nil and self.isCancelRequest == false then self.handler(endpoint, data, err) end
  end
  self.handler = nil
end

function HttpBase:onLoadingComplete(data)
	self:dispatchEvent(Event.new(Events.kComplete, data, self))
end
function HttpBase:onLoadingError(err)
	self:dispatchEvent(Event.new(Events.kError, err, self))

  if err ~= nil and table.exist({-2,-6,101},err) then 
      if not PrepackageUtil:isPreNoNetWork() then 
        checkNetwork()  
      end   
  end
end
function HttpBase:setCancelCallback(callback)
  self.cancelCallback = callback
end

function HttpBase:request(endPoint, requestData, onSuccess, onError)
    local loadCallback = function(endpoint, data, err)
    if err then
        he_log_info(endPoint.. " error: " .. err)
        onError(err)
    else
        he_log_info(endPoint.." success !")
        onSuccess(data);
    end
  end
  self.transponder:call(endPoint, requestData, loadCallback, rpc.SendingPriority.kHigh, false) 
end

--
-- Register ---------------------------------------------------------
--
RegisterHTTP = class(EventDispatcher)
function RegisterHTTP:load()
  local url = NetworkConfig.registerURL
  local mac = MetaInfo:getInstance():getMacAddress() or ""
  local idfa = ""
  if __IOS then idfa = AppController:getAdvertisingIdentifier() or "" end
  
  local version = MetaInfo:getInstance():getOsVersion() or ""
  local info = {
    mac = mac,
    idfa = idfa,
    sk = kDeviceID,
    ver = version,
    cv = _G.bundleVersion,
  }
  local function safe_get_mid()
    local mid = nil
    if PlatformConfig:isPlatform(PlatformNameEnum.kQQ) then mid = luajava.bindClass("com.happyelements.android.sns.tencent.TencentOpenSdk"):getMtaID() end
    info.mid = mid
  end
  pcall(safe_get_mid)
  --{idfa=idfa, mac=mac, ver=version}
  local infoStr = (table.serialize(info))
  local params = string.format("?info=%s", HeMathUtils:base64Encode(infoStr, string.len(infoStr)))
	url = url .. params
  print("RegisterHTTP:", info.sk)
	local request = HttpRequest:createGet(url)
    request:setConnectionTimeoutMs(5 * 1000)
    request:setTimeoutMs(10 * 1000)
   
    local function onRegisterFinished( response )
    	if response.httpCode ~= 200 then self:dispatchEvent(Event.new(Events.kError, err, self))
    	else
    		local message = response.body
    		local json  = table.deserialize(message)
    		if json and json.result == "success" then
    			local kTransformedUserID = json.uid
    			_G.kTransformedUserID = kTransformedUserID
    		end
        
        if __IOS then
          GspEnvironment:getInstance():setGameUserId(tostring(kTransformedUserID))
        elseif __ANDROID then 
          GspProxy:setGameUserId(tostring(kTransformedUserID)) 
        end
        HeGameDefault:setUserId(tostring(kTransformedUserID))
        if json and json.isNew then DcUtil:newUser() else DcUtil:dailyUser() end
    		self:dispatchEvent(Event.new(Events.kComplete, json, self))
    	end
    end
    
    if PrepackageUtil:isPreNoNetWork() then 
      self:dispatchEvent(Event.new(Events.kError, err, self))
    else
      HttpClient:getInstance():sendRequest(onRegisterFinished, request)
    end
end