------------------------------------------

-- Define

------------------------------------------
Global.Define = class("Define")

    Define.LayerKey = {
        WORLD = "world",
    }

    Define.FIELD_ROW = 8
    Define.FIELD_COLUMN = 8

    Define.TOUCH_MOVE_THRESHOLD = 8

    Define.PLAYER_SPEED = 0.5
    Define.DICE_SIZE = 40

    Define.DIRECTION_RIGHT   = cc.vec3(1, 0, 0)
    Define.DIRECTION_LEFT    = cc.vec3(-1, 0, 0)
    Define.DIRECTION_FORWARD = cc.vec3(0, 0, 1)
    Define.DIRECTION_BACK    = cc.vec3(0, 0, -1)

    Define.Packet = {}

    Define.Packet.PK_AUTH_HELLO = 100;
    Define.Packet.PK_ROOM_MAKE  = 1000;
    Define.Packet.PK_ROOM_JOIN  = 1001;
    Define.Packet.PK_DEPARTURE  = 2000;
