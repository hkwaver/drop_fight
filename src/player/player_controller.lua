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

        printInfo("EVENT_requestAttackSucceed")
    end

return MyClass
