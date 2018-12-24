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

        self._playerController = PlayerController:create()
        self._diceController = DiceController:create()
    end

-- ****************************************************************************************
-- request method
-- ****************************************************************************************

    ------------------------------------------
    -- EVENT_requestAttack
    ------------------------------------------
    function MyClass:EVENT_requestAttack()

        self._playerController:attack()
    end

    ------------------------------------------
    -- EVENT_requestMove
    ------------------------------------------
    function MyClass:EVENT_requestMove(direction)

        self._playerController:move(direction)
    end

return MyClass
