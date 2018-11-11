------------------------------------------

-- WorldLayer

------------------------------------------
Global.WorldLayer = class("WorldLayer", cc.Layer, Observable)

local MyClass = Global.WorldLayer

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
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

return MyClass
