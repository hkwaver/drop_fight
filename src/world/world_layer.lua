------------------------------------------

-- WorldLayer

------------------------------------------
Global.WorldLayer = class("WorldLayer", cc.Node, Observable)

local MyClass = Global.WorldLayer

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor(model)

        Observable.ctor(self)

        self:enableNodeEvents()

        self._model = model
        self._model:addObserver(self)
    end

    ------------------------------------------
    -- onEnter
    ------------------------------------------
    function MyClass:onEnter()

    end
    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

return MyClass
