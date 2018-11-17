------------------------------------------

-- DiceModel

------------------------------------------
Global.DiceModel = class("DiceModel", Observable)

local MyClass = Global.DiceModel

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor(model)

        Observable.ctor(self)

        self._index = 0
    end

    ------------------------------------------
    -- setIndex
    ------------------------------------------
    function MyClass:getIndex(index)
        return self._index
    end

    ------------------------------------------
    -- setIndex
    ------------------------------------------
    function MyClass:setIndex(index)

        self._index = index
        self:notify("EVENT_setIndex")
    end

return MyClass
