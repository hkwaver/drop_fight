------------------------------------------

-- GameScene

------------------------------------------
Global.GameScene = class("GameScene", cc.Scene)

local MyClass = Global.GameScene

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self:enableNodeEvents()
    end

    ------------------------------------------
    -- onEnter
    ------------------------------------------
    function MyClass:onEnter()

        local camera = cc.Camera:createPerspective(60, display.width / display.height, 1, 1000)
        camera:setCameraFlag(cc.CameraFlag.USER1)
        camera:setPosition3D(cc.vec3(0, 400, -400))
        camera:lookAt(cc.vec3(0, 0, 0), cc.vec3(0, 1, 0))
        self:addChild(camera)

        local light = cc.AmbientLight:create(cc.c3b(255, 255, 255))
        self:addChild(light)

        self:initialize()
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

    ------------------------------------------
    -- initialize
    ------------------------------------------
    function MyClass:initialize()


        self._worldModel = WorldModel:create()
        self._worldView = WorldLayer:create()
        self._worldView:setWorldModel(self._worldModel)

        self._playerModel = PlayerModel:create()
        self._playerView = PlayerView:create()
        self._playerView:setPlayerModel(self._playerModel)

        self._diceGroupModel = DiceGroupModel:create()
        self._diceGroupView = DiceGroupView:create()
        self._diceGroupView:setDiceGroupModel(self._diceGroupModel)

        self._worldController = WorldController:create()
        self._worldController:setWorldModel(self._worldModel)
        self._worldController:setPlayerModel(self._playerModel)
        self._worldController:setDiceGroupModel(self._diceGroupModel)
        self._worldController:setWorldView(self._worldView)

        self._playerController = PlayerController:create()
        self._playerController:setPlayerModel(self._playerModel)
        self._playerController:setDiceGroupModel(self._diceGroupModel)
        self._playerController:setPlayerView(self._playerView)

        self._diceController = DiceController:create()
        self._diceController:setDiceGroupModel(self._diceGroupModel)
        self._diceController:setDiceGroupView(self._diceGroupView)

        LayerManager.getInstance():addLayer(Define.LayerKey.WORLD, self._worldView)
        LayerManager.getInstance():transitionLayer(Define.LayerKey.WORLD)

        self._worldView:addChild(self._playerView)
        self._worldView:addChild(self._diceGroupView)
    end

return MyClass
