------------------------------------------

-- PlayerView

------------------------------------------
Global.PlayerView = class("PlayerView", cc.Node, Observable)

local MyClass = Global.PlayerView

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)

        self:enableNodeEvents()
        self:setCameraMask(cc.CameraFlag.USER1)
    end

    ------------------------------------------
    -- setPlayerModel
    ------------------------------------------
    function MyClass:setPlayerModel(model)

        self._playerModel = model
        self._playerModel:addObserver(self)
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

        local player = cc.Sprite3D:create("res/model/dice/Dice.c3b")
        player:setCameraMask(cc.CameraFlag.USER1)
        player:setTexture("res/model/dice/d6-black-dots.png")
        player:setScale(10)
        self:addChild(player)

        player:getMeshByName("d6Low"):setVisible(false)
        player:getMeshByName("d10"):setVisible(false)
        player:getMeshByName("d10Low"):setVisible(false)

        self:setPosition3D(cc.vec3(0, 50, 0))
    end

return MyClass
