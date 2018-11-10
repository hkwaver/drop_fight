------------------------------------------

-- LayerManager

------------------------------------------
Global.LayerManager = class("LayerManager")

local MyClass = Global.LayerManager

    MyClass.Instance = nil

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self._layers = {}
        self._currentLayerKey = nil
    end

    ------------------------------------------
    -- dispose
    ------------------------------------------
    function MyClass:dispose()

        self._layers = nil
    end

    ------------------------------------------
    -- getInstance
    ------------------------------------------
    function MyClass.getInstance()

        if MyClass.Instance == nil then

            MyClass.Instance = LayerManager:create()
        end

        return MyClass.Instance
    end

    ------------------------------------------
    -- addLayer
    ------------------------------------------
    function MyClass:addLayer(key, layer)

        local scene = cc.Director:getInstance():getRunningScene()
        if scene == nil then
            printError("Not found running scene")
            return
        end

        scene:addChild(layer)
        self._layers[key] = layer
    end

    ------------------------------------------
    -- removeLayer
    ------------------------------------------
    function MyClass:removeLayer(key)

        if self._layers[key] == nil then
            printError("Not found layer : " .. key)
            return
        end

        self._layers[key]:removeFromParent()
        self._layers[key] = nil
    end

    ------------------------------------------
    -- transitionLayer
    ------------------------------------------
    function MyClass:transitionLayer(key)

        local nextLayer = self._layers[key]
        if nextLayer == nil then
            printError("Not found layer : " .. key)
            return
        end

        local currentLayer = self:getCurrentLayer()
        if currentLayer ~= nil then

            currentLayer:hide()
        end

        self._currentLayerKey = key
        nextLayer:show()
    end


    ------------------------------------------
    -- getCurrentLayer
    ------------------------------------------
    function MyClass:getCurrentLayer()
        return self._currentLayerKey and self._layers[self._currentLayerKey]
    end

    ------------------------------------------
    -- getLayer
    ------------------------------------------
    function MyClass:getLayer(key)
        return self._layers[key]
    end

return MyClass
