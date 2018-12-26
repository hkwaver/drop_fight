------------------------------------------

-- DiceGroupController

------------------------------------------
Global.DiceGroupController = class("DiceGroupController")

local MyClass = Global.DiceGroupController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        self._diceControllerList = {}
    end

    ------------------------------------------
    -- setDiceGroupModel
    ------------------------------------------
    function MyClass:setDiceGroupModel(model)

        self._diceGroupModel = model
    end

    ------------------------------------------
    -- setDiceGroupView
    ------------------------------------------
    function MyClass:setDiceGroupView(view)

        self._diceGroupView = view
    end

    ------------------------------------------
    -- initialize
    ------------------------------------------
    function MyClass:initialize()

        for i = 1, Define.FIELD_ROW do

            for j = 1, Define.FIELD_COLUMN do

                local index = (j + i * Define.FIELD_COLUMN) - 1

                local model = DiceModel:create()
                model:setIndex(index)
                self._diceGroupModel:addDiceModel(i, j, model)

                local view = DiceView:create()
                view:setDiceModel(model)
                self._diceGroupView:addChild(view)

                local controller = DiceController:create()
                controller:setDiceModel(model)
                controller:setDiceView(view)
                table.insert(self._diceControllerList, controller)
            end
        end
    end

return MyClass
