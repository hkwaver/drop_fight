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

        self._network = nil
        self._listeners = {}
    end

    ------------------------------------------
    -- initialize
    ------------------------------------------
    function MyClass:initialize()

        local network = NetworkLogic:create()
        network:registerScriptHandler(handler(self, self.onPhotonOpen), cc.PHOTON_OPEN)
        network:registerScriptHandler(handler(self, self.onPhotonMessage) ,cc.PHOTON_MESSAGE)
        network:registerScriptHandler(handler(self, self.onPhotonClose), cc.PHOTON_CLOSE)
        network:registerScriptHandler(handler(self, self.onPhotonError), cc.PHOTON_ERROR)

        cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.update), 0, false)

        self._network = network
        self._listeners = {}
    end

    ------------------------------------------
    -- dispose
    ------------------------------------------
    function MyClass:dispose()

        self._network = nil
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
    -- update
    ------------------------------------------
    function MyClass:update()

        self._network:run()
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
    -- onPhotonMessage
    ------------------------------------------
    function MyClass:onPhotonMessage(data)

        local parseData = json.decode(data)

        printInfo("onPhotonMessage")
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
    -- onPhotonOpen
    ------------------------------------------
    function MyClass:onPhotonOpen(data)

        printInfo("onPhotonOpen")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onPhotonOpen ~= nil then

                self._listeners[i]:onPhotonOpen(data)
            end
        end
    end

    ------------------------------------------
    -- onPhotonClose
    ------------------------------------------
    function MyClass:onPhotonClose(data)

        printInfo("onPhotonClose")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onPhotonClose ~= nil then

                self._listeners[i]:onPhotonClose(data)
            end
        end
    end

    ------------------------------------------
    -- onPhotonError
    ------------------------------------------
    function MyClass:onPhotonError(data)

        printInfo("onPhotonError")
        dump(data)

        for i = 1, #self._listeners do

            if self._listeners[i].onPhotonError ~= nil then

                self._listeners[i]:onPhotonError(data)
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
