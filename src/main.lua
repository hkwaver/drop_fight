
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
        "system/layer_manager",
        "system/observable",
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
