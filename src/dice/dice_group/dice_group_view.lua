------------------------------------------

-- DiceGroupView

------------------------------------------
Global.DiceGroupView = class("DiceGroupView", cc.Node, Observable)

local MyClass = Global.DiceGroupView

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)

        self:enableNodeEvents()
        self:setCameraMask(cc.CameraFlag.USER1)
    end

    ------------------------------------------
    -- setDiceGroupModel
    ------------------------------------------
    function MyClass:setDiceGroupModel(model)

        self._diceGroupModel = model
        self._diceGroupModel:addObserver(self)
    end

    ------------------------------------------
    -- onEnter
    ------------------------------------------
    function MyClass:onEnter()

    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

return MyClass
