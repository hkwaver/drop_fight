------------------------------------------

-- DiceView

------------------------------------------
Global.DiceView = class("DiceView", cc.Sprite3D, Observable)

local MyClass = Global.DiceView

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor(model)

        Observable.ctor(self)

        self:enableNodeEvents()
        self:setCameraMask(cc.CameraFlag.USER1)

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
    end

    ------------------------------------------
    -- EVENT_setIndex
    ------------------------------------------
    function MyClass:EVENT_setIndex()

        local index =  self._model:getIndex()
        local x = (index - 1) % Define.FIELD_COLUMN - math.floor(Define.FIELD_COLUMN / 2)
        local z = math.floor((index - 1) / Define.FIELD_COLUMN) - math.floor(Define.FIELD_COLUMN / 2)

        self:setPosition3D(cc.vec3(45 * x, 0.0, 45 * z))
    end

return MyClass
