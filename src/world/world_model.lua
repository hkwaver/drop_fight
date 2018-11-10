------------------------------------------

-- WorldModel

------------------------------------------
Global.WorldModel = class("WorldModel", Observable)

local MyClass = Global.WorldModel

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)
    end

return MyClass
