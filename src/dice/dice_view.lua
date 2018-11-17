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
        dice:setTexture("res/model/dice/d6-white-dots.png")
        dice:setScale(20)
        dice:setPosition(cc.p(300, 200))
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
        local x = (index - 1) % Define.FIELD_COLUMN
        local y = (index - 1) / Define.FIELD_COLUMN

        self:setPosition(cc.p(20 * x, 20 * y))
    end

return MyClass
