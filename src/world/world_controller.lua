------------------------------------------

-- WorldController

------------------------------------------
Global.WorldController = class("WorldController")

local MyClass = Global.WorldController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self._model = WorldModel:create()
        self._view = WorldLayer:create(self._model)

        LayerManager.getInstance():addLayer(Define.LayerKey.WORLD, self._view)
    end

-- ****************************************************************************************
-- request method
-- ****************************************************************************************

return MyClass
