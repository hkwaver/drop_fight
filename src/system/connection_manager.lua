------------------------------------------

-- ConnectionManager

------------------------------------------
Global.ConnectionManager = class("ConnectionManager")

local MyClass = Global.ConnectionManager

    MyClass.Instance = nil

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        local socket = cc.WebSocket:create('ws://127.0.0.1:5001', {"protocol"})

        socket:registerScriptHandler(handler(self, self.onWebSocketOpen), cc.WEBSOCKET_OPEN)
        socket:registerScriptHandler(handler(self, self.onWebSocketMessage) ,cc.WEBSOCKET_MESSAGE)
        socket:registerScriptHandler(handler(self, self.onWebSocketClose), cc.WEBSOCKET_CLOSE)
        socket:registerScriptHandler(handler(self, self.onWebSocketError), cc.WEBSOCKET_ERROR)

        self._socket = socket
    end

    ------------------------------------------
    -- dispose
    ------------------------------------------
    function MyClass:dispose()

        self._socket = nil
    end

    ------------------------------------------
    -- getInstance
    ------------------------------------------
    function MyClass.getInstance()

        if MyClass.Instance == nil then

            MyClass.Instance = ConnectionManager:create()
        end

        return MyClass.Instance
    end

    ------------------------------------------
    -- onWebSocketOpen
    ------------------------------------------
    function MyClass:onWebSocketOpen(data)

        printInfo("onWebSocketOpen")
        dump(data)
    end

    ------------------------------------------
    -- onWebSocketMessage
    ------------------------------------------
    function MyClass:onWebSocketMessage(data)

        printInfo("onWebSocketMessage")
        dump(data)
    end

    ------------------------------------------
    -- onWebSocketClose
    ------------------------------------------
    function MyClass:onWebSocketClose(data)

        printInfo("onWebSocketClose")
        dump(data)
    end

    ------------------------------------------
    -- onWebSocketError
    ------------------------------------------
    function MyClass:onWebSocketError(data)

        printInfo("onWebSocketError")
        dump(data)
    end

    ------------------------------------------
    -- send
    ------------------------------------------
    function MyClass:send(data)

        if self._socket == nil then
            return
        end

        if cc.WEBSOCKET_STATE_OPEN == self._socket:getReadyState() then

            self._socket:sendString(data)
        else

            printInfo("web socket closed")
        end
    end

return MyClass
