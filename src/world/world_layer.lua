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

        local dice = cc.Sprite3D:create("res/model/dice/Dice.c3b")
        dice:setTexture("res/model/dice/d6-white-dots.png")
        dice:setScale(20)
        dice:setPosition(cc.p(300, 200))
        self:addChild(dice)

        local dice6 = dice:getMeshByName("d6")
        local dice6Low = dice:getMeshByName("d6Low")
        local dice10 = dice:getMeshByName("d10")
        local dice10Low = dice:getMeshByName("d10Low")
        dice6Low:setVisible(false)
        dice10:setVisible(false)
        dice10Low:setVisible(false)

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

        local action = cc.RotateBy:create(1, cc.vec3(0, 90, 0))
        self._viewRef.dice:runAction(action)
    end

return MyClass
