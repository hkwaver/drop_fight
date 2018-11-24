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

return MyClass
