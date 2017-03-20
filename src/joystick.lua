local jslib = require("libs.joystick")

local joystick = display.newGroup()
local joystickElement

function joystick:initialize(callback)
    joystickElement = jslib.new(20, 70, 1, 0.4)
    joystickElement.x = 150
    joystickElement.y = 650

    joystick._catchTimer(event, callback)

    joystickElement:activate()

    local function activateFunction()
        joystick._catchTimer(event, callback)
    end

    timer.performWithDelay(100, activateFunction, -1)
end

function joystick:_catchTimer(callback)
    callback(joystickElement:getDirection(), joystickElement:getAngle(), joystickElement:getDistance())
    return true
end

return joystick