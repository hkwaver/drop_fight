------------------------------------------

-- WorldLayer

------------------------------------------
Global.WorldLayer = class("WorldLayer", cc.Layer, Observable)

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

        self:initializeView()

    end

    ------------------------------------------
    -- onExit
    ------------------------------------------
    function MyClass:onExit()

    end

    ------------------------------------------
    -- initializeView
    ------------------------------------------
    function MyClass:initializeView()

        local touchPanel = ccui.Layout:create()
        touchPanel:setContentSize(display.width, display.height)
        self:addChild(touchPanel)

        local listener = cc.EventListenerTouchOneByOne:create()
        listener:registerScriptHandler(handler(self, self.onTouchBegan), cc.Handler.EVENT_TOUCH_BEGAN )
        listener:registerScriptHandler(handler(self, self.onTouchMoved), cc.Handler.EVENT_TOUCH_MOVED )
        listener:registerScriptHandler(handler(self, self.onTouchEnded), cc.Handler.EVENT_TOUCH_ENDED )

        local eventDispatcher = touchPanel:getEventDispatcher()
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, touchPanel)

        self._viewRef = {
            dice = dice,
        }
    end

    ------------------------------------------
    -- onTouchBegan
    ------------------------------------------
    function MyClass:onTouchBegan(touch, event)

        return true
    end

    ------------------------------------------
    -- onTouchMoved
    ------------------------------------------
    function MyClass:onTouchMoved(touch, event)

    end

    ------------------------------------------
    -- onTouchEnded
    ------------------------------------------
    function MyClass:onTouchEnded(touch, event)

        self:notify("EVENT_requestTouchEnd")
    end

return MyClass
