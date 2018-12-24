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

        self._model = PlayerModel:create()
        self._view = PlayerView:create(self._model)
        layer:addChild(self._view)
    end

    ------------------------------------------
    -- attack
    ------------------------------------------
    function MyClass:attack()

    end

    ------------------------------------------
    -- move
    ------------------------------------------
    function MyClass:move(direction)

    end

return MyClass
