------------------------------------------

-- PlayerController

------------------------------------------
Global.PlayerController = class("PlayerController")

local MyClass = Global.PlayerController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        local layer = LayerManager.getInstance():getCurrentLayer()

        local model = PlayerModel:create()
        local view = PlayerView:create(model)
        layer:addChild(view)
    end

return MyClass
