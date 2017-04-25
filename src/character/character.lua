local physics = require 'physics'

local characterElement
local moveSpeed = 150;

return (function()

    local function create()
        characterElement = display.newImageRect('src/character/images/character.png', 200, 150)
        characterElement.x = 200
        characterElement.y = 200
        characterElement.powers = {}
        physics.addBody(characterElement, { density = 0, friction = 0, bounce = 0 })
    end

    local function move(direction, distance)
        if (characterElement.x and characterElement.y) then
            transition.to(characterElement, {
                x = characterElement.x + direction.x * (distance * moveSpeed),
                y = characterElement.y + direction.y * -(distance * moveSpeed)
            })
        end
    end

    local function destroy()
        display.remove(characterElement)
    end

    return {
        create = create,
        move = move,
        destroy = destroy
    }
end)()
