return (function()
    local character

    local function interact(event)
        if (event.phase == "began") then
            character.move(event.x)
        elseif (event.phase == "moved") then
--            character.move(event.x)
        elseif (event.phase == "ended") then
            character.stopMoving()
        end
        return true -- Prevents tap/touch propagation to underlying objects
    end

    local function setCharacter(char)
        character = char
    end

    return {
        interact = interact,
        setCharacter = setCharacter
    }
end)()