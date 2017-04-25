return function (event, cb)
    local character
    local element
    if (event.object1.name == true) then
        character = event.object2
        element = event.object1
    else
        character = event.object1
        element = event.object2
    end
    cb(character, element)
end