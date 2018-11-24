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

        local controller = WorldController:create()
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

return MyClass
