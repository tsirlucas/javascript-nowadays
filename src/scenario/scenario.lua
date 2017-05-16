local background = require 'src.scenario.background.background'
local floor = require 'src.scenario.floor.floor'

local speed;
local scenarioTimer

return (function()

    local function moveScenario()
        background.update(speed)
    end

    local function run()
        scenarioTimer = timer.performWithDelay(1, moveScenario, -1)
    end

    local function initialize(group, initialSpeed)
        speed = initialSpeed
        background.create(group);
        floor.create(group);
        run()
    end

    local function getFloor()
        return floor
    end

    local function destroy()
        timer.cancel(scenarioTimer)
        background.destroy()
        floor.destroy()
    end

    return {
        initialize = initialize,
        moveScenario = moveScenario,
        getFloor = getFloor,
        run = run,
        destroy = destroy
    }
end)()
