------------------------------------------

-- DiceController

------------------------------------------
Global.DiceController = class("DiceController")

local MyClass = Global.DiceController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        local layer = LayerManager.getInstance():getCurrentLayer()

        self._diceMap = {}

        for i = 1, Define.FIELD_ROW do

            local columnLine = {}

            for j = 1, Define.FIELD_COLUMN do

                local model = DiceModel:create()
                local view = DiceView:create(model)
                layer:addChild(view)

                model:setIndex(j + i * Define.FIELD_COLUMN)

                table.insert(columnLine, model)
            end

            table.insert(self._diceMap, columnLine)
        end
    end

return MyClass
