------------------------------------------

-- DiceGroupModel

------------------------------------------
Global.DiceGroupModel = class("DiceGroupModel", Observable)

local MyClass = Global.DiceGroupModel

    ------------------------------------------
    -- ctor
    ------------------------------------------
    function MyClass:ctor()

        Observable.ctor(self)

        self._diceModelMap = {}
    end

    ------------------------------------------
    -- dropLine
    ------------------------------------------
    function MyClass:addDiceModel(row, column, model)

        self._diceModelMap[row] = self._diceModelMap[row] or {}
        self._diceModelMap[row][column] = model
    end

    ------------------------------------------
    -- dropLine
    ------------------------------------------
    function MyClass:dropLine(baseIndex, direction)

        local row = math.floor(baseIndex / Define.FIELD_COLUMN)
        local column = (baseIndex % Define.FIELD_COLUMN) + 1

        for i = column, #self._diceModelMap[row] do

            self._diceModelMap[row][i]:drop()
        end
    end


return MyClass
