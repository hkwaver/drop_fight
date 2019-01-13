
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos/init"

cc.exports.Global = cc.exports

local function main()

    local requires = {
        "game_scene",

        "system/define",
        "system/rxi_json",
        "system/layer_manager",
        "system/observable",
        "system/connection_manager",

        "world/world_model",
        "world/world_layer",
        "world/world_controller",

        "player/player_model",
        "player/player_view",
        "player/player_controller",

        "dice/dice_model",
        "dice/dice_view",
        "dice/dice_controller",

        "dice/dice_group/dice_group_model",
        "dice/dice_group/dice_group_view",
        "dice/dice_group/dice_group_controller",
    }

    for i,value in ipairs(requires) do
        print("require @ " .. value)
        require(value)
    end

    cc.Director:getInstance():runWithScene(GameScene:create())
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
