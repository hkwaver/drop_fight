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

        local controller = WorldController:create()
    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

return MyClass
