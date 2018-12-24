------------------------------------------

-- PlayerModel

------------------------------------------
Global.PlayerModel = class("PlayerModel", Observable)

local MyClass = Global.PlayerModel

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)
    end

    ------------------------------------------
    -- getIndex
    ------------------------------------------
    function MyClass:getIndex()
        return 22
    end

    ------------------------------------------
    -- getDirection
    ------------------------------------------
    function MyClass:getDirection()
        return 1
    end

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:attack()

        self:notify("EVENT_playerAttack")
    end

    ------------------------------------------
    -- move
    ------------------------------------------
    function MyClass:move(direction)

    end

return MyClass
