------------------------------------------
-- Observable
------------------------------------------
cc.exports.Observable = class("Observable")

function Observable:ctor()
    self._observers = {}
end

function Observable:dispose()
    self._observers = nil
end

function Observable:addObserver(observer)
    table.insert(self._observers, observer)
end

function Observable:removeObserver(observer)

    for i = 1, #self._observers do

        if self._observers[i] == observer then

            table.remove(self._observers, i)
            return
        end
    end
end

function Observable:notify(key, args)

    for i = 1, #self._observers do

        local observer = self._observers[i]
        if observer[key] ~= nil then

            observer[key](observer, args)
        end
    end
end

return Observable
