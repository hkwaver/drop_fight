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

        self._x = 0
        self._y = 20
        self._z = 0
        self._direction = cc.vec3(0, 0, 0)
    end

    ------------------------------------------
    -- getIndex
    ------------------------------------------
    function MyClass:getIndex()

        local x = math.floor(self._x / Define.DICE_SIZE) + math.floor(Define.FIELD_COLUMN / 2)
        local z = math.floor(self._z / Define.DICE_SIZE) + math.floor(Define.FIELD_ROW / 2)

        return x + z * Define.FIELD_COLUMN
    end

    ------------------------------------------
    -- getPosition
    ------------------------------------------
    function MyClass:getPosition()
        return cc.vec3(self._x, self._y, self._z)
    end

    ------------------------------------------
    -- getDirection
    ------------------------------------------
    function MyClass:getDirection()
        return self._direction
    end

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:attack()

        self:notify("EVENT_playerAttack")
    end

    ------------------------------------------
    -- move
    ------------------------------------------
    function MyClass:move(direction)

        self._direction = direction
        self._x = self._x + direction.x * Define.PLAYER_SPEED
        self._z = self._z + direction.z * Define.PLAYER_SPEED

        self:notify("EVENT_playerMove")
    end

return MyClass
