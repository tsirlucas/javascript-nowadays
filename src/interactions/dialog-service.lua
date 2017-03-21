local dialog = display.newGroup()

function dialog:collisions(element)
    print("Your character collided with the " .. element)
end

function dialog:interact(type, element)
    if (type == 'collision') then
        dialog:collisions(element)
    end
end

return dialog