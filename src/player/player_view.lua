------------------------------------------

-- PlayerView

------------------------------------------
Global.PlayerView = class("PlayerView", cc.Node, Observable)

local MyClass = Global.PlayerView

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

        local player = cc.Sprite3D:create("res/model/unitychan/unitychan.c3b")
        player:setCameraMask(cc.CameraFlag.USER1)
        player:setScale(0.5)
        self:addChild(player)

        self:setPosition3D(cc.vec3(0, 50, 0))
    end

return MyClass
