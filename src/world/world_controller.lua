------------------------------------------

-- WorldController

------------------------------------------
Global.WorldController = class("WorldController")

local MyClass = Global.WorldController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self._model = WorldModel:create()
        self._view = WorldLayer:create(self._model)
        self._view:addObserver(self)

        LayerManager.getInstance():addLayer(Define.LayerKey.WORLD, self._view)
        LayerManager.getInstance():transitionLayer(Define.LayerKey.WORLD)

        self._diceController = DiceController:create()
    end

-- ****************************************************************************************
-- request method
-- ****************************************************************************************

    ------------------------------------------
    -- EVENT_requestTouchEnd
    ------------------------------------------
    function MyClass:EVENT_requestTouchEnd()
        print("EVENT_requestTouchEnd")
    end

return MyClass
