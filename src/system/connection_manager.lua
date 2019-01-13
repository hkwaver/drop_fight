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

        self._socket = nil
        self._listeners = {}
    end

    ------------------------------------------
    -- initialize
    ------------------------------------------
    function MyClass:initialize()

        local socket = cc.WebSocket:create('ws://127.0.0.1:5001', {"protocol"})

        socket:registerScriptHandler(handler(self, self.onWebSocketOpen), cc.WEBSOCKET_OPEN)
        socket:registerScriptHandler(handler(self, self.onWebSocketMessage) ,cc.WEBSOCKET_MESSAGE)
        socket:registerScriptHandler(handler(self, self.onWebSocketClose), cc.WEBSOCKET_CLOSE)
        socket:registerScriptHandler(handler(self, self.onWebSocketError), cc.WEBSOCKET_ERROR)

        self._socket = socket
        self._listeners = {}
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
    -- addListener
    ------------------------------------------
    function MyClass:addListener(listener)

        table.insert(self._listeners, listener)
    end

    ------------------------------------------
    -- removeListener
    ------------------------------------------
    function MyClass:removeListener(listener)

        for i = 1, #self._listeners do

            if self._listeners[i] == listener then

                table.remove(self._listeners, i)
                return
            end
        end
    end

    ------------------------------------------
    -- onWebSocketMessage
    ------------------------------------------
    function MyClass:onWebSocketMessage(data)

        local parseData = json.decode(data)

        printInfo("onWebSocketMessage")
        dump(parseData)

        for key, value in pairs(Define.Packet) do

            if parseData.type == value then

                for i = 1, #self._listeners do

                    local listener = self._listeners[i]
                    if listener[key] ~= nil then

                        listener[key](listener, parseData.data)
                    end
                end
            end
        end
    end

    ------------------------------------------
    -- onWebSocketClose
    ------------------------------------------
    function MyClass:onWebSocketOpen(data)

        printInfo("onWebSocketOpen")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onWebSocketOpen ~= nil then

                self._listeners[i]:onWebSocketOpen(data)
            end
        end
    end

    ------------------------------------------
    -- onWebSocketClose
    ------------------------------------------
    function MyClass:onWebSocketClose(data)

        printInfo("onWebSocketClose")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onWebSocketClose ~= nil then

                self._listeners[i]:onWebSocketClose(data)
            end
        end
    end

    ------------------------------------------
    -- onWebSocketError
    ------------------------------------------
    function MyClass:onWebSocketError(data)

        printInfo("onWebSocketError")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onWebSocketError ~= nil then

                self._listeners[i]:onWebSocketError(data)
            end
        end
    end

    ------------------------------------------
    -- send
    ------------------------------------------
    function MyClass:send(data)

        if self._socket == nil then
            return
        end

        if cc.WEBSOCKET_STATE_OPEN == self._socket:getReadyState() then

            self._socket:sendString(json.encode(data))
        else

            printInfo("web socket closed")
        end
    end

return MyClass
