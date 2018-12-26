------------------------------------------

-- WorldLayer

------------------------------------------
Global.WorldLayer = class("WorldLayer", cc.Layer, Observable)

local MyClass = Global.WorldLayer

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)

        self:enableNodeEvents()

        self._isPressed = false
        self._direction = cc.vec3(0, 0, 0)
    end

    ------------------------------------------
    -- setWorldModel
    ------------------------------------------
    function MyClass:setWorldModel(model)

        self._worldModel = model
        self._worldModel:addObserver(self)
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
        listener:registerScriptHandler(handler(self, self.onTouchBegan), cc.Handler.EVENT_TOUCH_BEGAN)
        listener:registerScriptHandler(handler(self, self.onTouchMoved), cc.Handler.EVENT_TOUCH_MOVED)
        listener:registerScriptHandler(handler(self, self.onTouchEnded), cc.Handler.EVENT_TOUCH_ENDED)

        local eventDispatcher = touchPanel:getEventDispatcher()
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, touchPanel)

        cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.update), 0, false)
    end

    ------------------------------------------
    -- update
    ------------------------------------------
    function MyClass:update(dt)

        if not self._isPressed then
            return
        end

        self:notify("EVENT_requestMove", self._direction)
    end

    ------------------------------------------
    -- onTouchBegan
    ------------------------------------------
    function MyClass:onTouchBegan(touch, event)

        self._isPressed = true

        return true
    end

    ------------------------------------------
    -- onTouchMoved
    ------------------------------------------
    function MyClass:onTouchMoved(touch, event)

        local startPos = touch:getStartLocation()
        local currentPos = touch:getLocation()

        if cc.pGetDistance(currentPos, startPos) < Define.TOUCH_MOVE_THRESHOLD then
            return
        end

        local angle = cc.pToAngleSelf(cc.pSub(currentPos, startPos))

        if - math.pi / 4 < angle and angle <= math.pi / 4 then

            self._direction = Define.DIRECTION_RIGHT

        elseif math.pi / 4 < angle and angle <= 3 * math.pi / 4 then

            self._direction = Define.DIRECTION_FORWARD

        elseif - 3 * math.pi / 4 < angle and angle <= - math.pi / 4 then

            self._direction = Define.DIRECTION_BACK

        else

            self._direction = Define.DIRECTION_LEFT
        end
    end

    ------------------------------------------
    -- onTouchEnded
    ------------------------------------------
    function MyClass:onTouchEnded(touch, event)

        local startPos = touch:getStartLocation()
        local currentPos = touch:getLocation()

        if cc.pGetDistance(currentPos, startPos) < Define.TOUCH_MOVE_THRESHOLD then

            self:notify("EVENT_requestAttack")
        end

        self._isPressed = false
    end

return MyClass
