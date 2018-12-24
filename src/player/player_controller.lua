------------------------------------------

-- PlayerController

------------------------------------------
Global.PlayerController = class("PlayerController")

local MyClass = Global.PlayerController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

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
    -- setPlayerView
    ------------------------------------------
    function MyClass:setPlayerView(view)

        self._playerView = view
        self._playerView:addObserver(self)
    end

-- ****************************************************************************************
-- request method
-- ****************************************************************************************

    ------------------------------------------
    -- EVENT_requestAttackSucceed
    ------------------------------------------
    function MyClass:EVENT_requestAttackSucceed()

        local index = self._playerModel:getIndex()
        local direction = self._playerModel:getDirection()
        self._diceGroupModel:dropLine(index, direction)
    end

return MyClass
