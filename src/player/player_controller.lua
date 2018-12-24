------------------------------------------

-- PlayerController

------------------------------------------
Global.PlayerController = class("PlayerController")

local MyClass = Global.PlayerController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

    end

    ------------------------------------------
    -- setPlayerModel
    ------------------------------------------
    function MyClass:setPlayerModel(model)
        self._playerModel = model
    end

    ------------------------------------------
    -- setPlayerView
    ------------------------------------------
    function MyClass:setPlayerView(view)
        self._playerView = view
    end

return MyClass
