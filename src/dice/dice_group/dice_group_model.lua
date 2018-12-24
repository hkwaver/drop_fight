------------------------------------------

-- DiceGroupModel

------------------------------------------
Global.DiceGroupModel = class("DiceGroupModel", Observable)

local MyClass = Global.DiceGroupModel

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)
    end

return MyClass
