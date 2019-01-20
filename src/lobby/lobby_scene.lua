------------------------------------------

-- LobbyScene

------------------------------------------
Global.LobbyScene = class("LobbyScene", cc.Scene)

local MyClass = Global.LobbyScene

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self._playerId = math.random(1000, 9999)

        self:enableNodeEvents()
    end

    ------------------------------------------
    -- onEnter
    ------------------------------------------
    function MyClass:onEnter()

        ConnectionManager.getInstance():addListener(self)

        self:initialize()
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

        ConnectionManager.getInstance():removeListener(self)
    end

    ------------------------------------------
    -- initialize
    ------------------------------------------
    function MyClass:initialize()

        local posX = display.center.x
        local posY = display.center.y

        local roomMakeButton = ccui.Button:create("res/HelloWorld.png")
        roomMakeButton:setContentSize(300, 120)
        roomMakeButton:setPosition(cc.p(posX, posY))
        roomMakeButton:addTouchEventListener(handler(self, self.onPressRoomMake))
        self:addChild(roomMakeButton)

        local roomJoinButton = ccui.Button:create("res/HelloWorld.png")
        roomJoinButton:setContentSize(320, 120)
        roomJoinButton:setPosition(cc.p(posX, posY - 300))
        roomJoinButton:addTouchEventListener(handler(self, self.onPressDeparture))
        self:addChild(roomJoinButton)

        local joinCountLabel = cc.Label:createWithSystemFont("label", "Arial", 18)
        joinCountLabel:setPosition(display.center)
        self:addChild(joinCountLabel)

        self._uiRef = {
            joinCountLabel = joinCountLabel,
        }
    end

    ------------------------------------------
    -- onPressRoomMake
    ------------------------------------------
    function MyClass:onPressRoomMake(sender, type)

        if type ~= ccui.TouchEventType.ended then
            return
        end

        ConnectionManager.getInstance():send({
            type = Define.Packet.PK_ROOM_MAKE,
            data = {
                player_id = self._playerId,
            }
        })
    end

    ------------------------------------------
    -- onPressRoomJoin
    ------------------------------------------
    function MyClass:onPressRoomJoin(sender, type)

        if type ~= ccui.TouchEventType.ended then
            return
        end

        ConnectionManager.getInstance():send({
            type = Define.Packet.PK_ROOM_JOIN,
            data = {
                player_id = self._playerId,
            }
        })
    end

    ------------------------------------------
    -- onPressDeparture
    ------------------------------------------
    function MyClass:onPressDeparture(sender, type)

        if type ~= ccui.TouchEventType.ended then
            return
        end

        ConnectionManager.getInstance():send({
            type = Define.Packet.PK_DEPARTURE,
        })
    end

-- ****************************************************************************************
-- packet handler
-- ****************************************************************************************

    ------------------------------------------
    -- PK_ROOM_MAKE
    ------------------------------------------
    function MyClass:PK_ROOM_MAKE(data)

        -- display.runScene(GameScene:create())
    end

    ------------------------------------------
    -- PK_DEPARTURE
    ------------------------------------------
    function MyClass:PK_DEPARTURE(data)

        display.runScene(GameScene:create())
    end

return MyClass
