local jslib = require('libs.joystick')

local joystick = display.newGroup()
local joystickElement

return (function()

    local function _catchTimer(callback)
        callback(joystickElement:getDirection(), joystickElement:getAngle(), joystickElement:getDistance())
        return true
    end


    local function initialize(callback)
        joystickElement = jslib.new(20, 70, 1, 0.4)
        joystickElement.x = 150
        joystickElement.y = 650

        _catchTimer(callback)

        joystickElement:activate()

        local function activateFunction()
            _catchTimer(callback)
        end

        timer.performWithDelay(100, activateFunction, -1)
    end

    local function destroy()
        display.remove(joystickElement)
    end

    return {
        initialize = initialize,
        destroy = destroy
    }
end)()