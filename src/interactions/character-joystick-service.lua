return (function()

    local function initialize(character, joystick)
        local joystickCallback = function(direction, angle, distance)
            if (distance ~= 0) then
                local movementScale = {}
                movementScale.x = math.cos(math.rad(angle))
                movementScale.y = math.sin(math.rad(angle))
                character.move(movementScale, distance)
            end
        end
        joystick.initialize(joystickCallback);
    end

    return{
        initialize = initialize
    }
end)()