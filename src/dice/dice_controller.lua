------------------------------------------

-- DiceController

------------------------------------------
Global.DiceController = class("DiceController")

local MyClass = Global.DiceController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

    end

    ------------------------------------------
    -- setDiceModel
    ------------------------------------------
    function MyClass:setDiceModel(model)

        self._diceModel = model
    end

    ------------------------------------------
    -- setDiceView
    ------------------------------------------
    function MyClass:setDiceView(view)

        self._diceView = view
        self._diceView:addObserver(self)
    end

    ------------------------------------------
    -- EVENT_requestChangeVisible
    ------------------------------------------
    function MyClass:EVENT_requestChangeVisible()

        self._diceModel:setState(DiceModel.STATE_VISIBLE)
    end

    ------------------------------------------
    -- EVENT_requestChangeDrop
    ------------------------------------------
    function MyClass:EVENT_requestChangeDrop()

        self._diceModel:setState(DiceModel.STATE_DROP)
    end

    ------------------------------------------
    -- EVENT_requestChangeInvisible
    ------------------------------------------
    function MyClass:EVENT_requestChangeInvisible()

        self._diceModel:setState(DiceModel.STATE_INVISIBLE)
    end

return MyClass
