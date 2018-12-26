------------------------------------------

-- DiceModel

------------------------------------------
Global.DiceModel = class("DiceModel", Observable)

local MyClass = Global.DiceModel

    MyClass.STATE_NONE = 0
    MyClass.STATE_VISIBLE   = 1
    MyClass.STATE_IGNITION  = 2
    MyClass.STATE_DROP      = 3
    MyClass.STATE_INVISIBLE = 4


    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)

        self._index = 0
    end

    ------------------------------------------
    -- getIndex
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

    ------------------------------------------
    -- isState
    ------------------------------------------
    function MyClass:isState(state)
        return self._state == state
    end

    ------------------------------------------
    -- getState
    ------------------------------------------
    function MyClass:getState()
        return self._state
    end

    ------------------------------------------
    -- Ignition
    ------------------------------------------
    function MyClass:setState(state)

        self._state = state
        self:notify("EVENT_setState")
    end

return MyClass
