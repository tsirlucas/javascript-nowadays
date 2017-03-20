local characterJoystick = display.newGroup()

function characterJoystick:initialize(character, joystick)
    local joystickCallback = function(direction, angle, distance)
        if (distance ~= 0) then
            local movementScale = {}
            movementScale.x = math.cos(math.rad(angle))
            movementScale.y = math.sin(math.rad(angle))
            character.move(event, movementScale, distance)
        end
    end
    joystick.initialize(event, joystickCallback);
end

return characterJoystick