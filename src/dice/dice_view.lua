------------------------------------------

-- DiceView

------------------------------------------
Global.DiceView = class("DiceView", cc.Node, Observable)

local MyClass = Global.DiceView

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor(model)

        Observable.ctor(self)

        self:enableNodeEvents()
        self:setCameraMask(cc.CameraFlag.USER1)
    end

    ------------------------------------------
    -- setDiceModel
    ------------------------------------------
    function MyClass:setDiceModel(model)

        self._model = model
        self._model:addObserver(self)
    end

    ------------------------------------------
    -- onEnter
    ------------------------------------------
    function MyClass:onEnter()

        self:initializeView()
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

    ------------------------------------------
    -- initializeView
    ------------------------------------------
    function MyClass:initializeView()

        local dice = cc.Sprite3D:create("res/model/dice/Dice.c3b")
        dice:setCameraMask(cc.CameraFlag.USER1)
        dice:setTexture("res/model/dice/d6-white-dots.png")
        dice:setScale(20)
        dice:setPosition3D(cc.vec3(0, 0, 0))
        self:addChild(dice)

        local dice6 = dice:getMeshByName("d6")
        local dice6Low = dice:getMeshByName("d6Low")
        local dice10 = dice:getMeshByName("d10")
        local dice10Low = dice:getMeshByName("d10Low")
        dice6Low:setVisible(false)
        dice10:setVisible(false)
        dice10Low:setVisible(false)

        self._dice = dice

        local index =  self._model:getIndex()
        self:setPositionByIndex(index)
    end

    ------------------------------------------
    -- setPositionByIndex
    ------------------------------------------
    function MyClass:setPositionByIndex(index)

        local x = index % Define.FIELD_COLUMN - math.floor(Define.FIELD_COLUMN / 2) + 0.5
        local z = math.floor(index / Define.FIELD_COLUMN) - math.floor(Define.FIELD_ROW / 2) - 0.5

        self:setPosition3D(cc.vec3(Define.DICE_SIZE * x, 0.0, Define.DICE_SIZE * z))
    end

    ------------------------------------------
    -- EVENT_setIndex
    ------------------------------------------
    function MyClass:EVENT_setIndex()

        self:setPositionByIndex(self._model:getIndex())
    end

    ------------------------------------------
    -- EVENT_drop
    ------------------------------------------
    function MyClass:EVENT_drop()

        self:setVisible(false)
    end

return MyClass
