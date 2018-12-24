------------------------------------------

-- WorldController

------------------------------------------
Global.WorldController = class("WorldController")

local MyClass = Global.WorldController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

    end

    ------------------------------------------
    -- setWorldModel
    ------------------------------------------
    function MyClass:setWorldModel(model)
        self._worldModel = model
    end

    ------------------------------------------
    -- setPlayerModel
    ------------------------------------------
    function MyClass:setPlayerModel(model)
        self._playerModel = model
    end

    ------------------------------------------
    -- setDiceGroupModel
    ------------------------------------------
    function MyClass:setDiceGroupModel(model)
        self._diceGroupModel = model
    end

    ------------------------------------------
    -- setWorldView
    ------------------------------------------
    function MyClass:setWorldView(view)

        self._worldView = view
        self._worldView:addObserver(self)
    end

-- ****************************************************************************************
-- request method
-- ****************************************************************************************

    ------------------------------------------
    -- EVENT_requestAttack
    ------------------------------------------
    function MyClass:EVENT_requestAttack()

        self._playerModel:attack()
    end

    ------------------------------------------
    -- EVENT_requestMove
    ------------------------------------------
    function MyClass:EVENT_requestMove(direction)

        self._playerModel:move(direction)
    end

return MyClass
