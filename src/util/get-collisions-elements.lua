return function (event, cb)
    local element
    local lib
    if (event.object1.lib == true) then
        element = event.object2
        lib = event.object1
    else
        lib = event.object2
        element = event.object1
    end
    cb(lib, element)
end