------------------------------------------

-- DiceController

------------------------------------------
Global.DiceController = class("DiceController")

local MyClass = Global.DiceController

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

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
                view:addObserver(self)
                self._diceGroupView:addChild(view)
            end
        end
    end

return MyClass
