local character = display.newGroup()
local characterElement
local moveSpeed = 150;
function character:create()
    characterElement = display.newImageRect("src/character/images/character.png", 200, 150)
    characterElement.x = 200
    characterElement.y = 200
end

function character:move(direction, distance)
    transition.to(characterElement, {
        x = characterElement.x + direction.x * (distance * moveSpeed),
        y = characterElement.y + direction.y * -(distance * moveSpeed)
    })
end

return character
