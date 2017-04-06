local background = require 'src.scenario.background.background'
local floor = require 'src.scenario.floor.floor'
local roof = require 'src.scenario.roof.roof'

local speed;
local scenarioTimer

return (function()

    local function moveScenario()
        background.update(speed)
        roof.update(speed / 15)
        floor.update(speed / 15)
    end

    local function run()
        scenarioTimer = timer.performWithDelay(1, moveScenario, -1)
    end

    local function initialize(initialSpeed)
        speed = initialSpeed
        background.create();
        floor.create();
        roof.create();
        run()
    end

    local function getFloor()
        return floor
    end

    local function getRoof()
        return roof
    end

    local function destroy()
        timer.cancel(scenarioTimer)
        background.destroy()
        roof.destroy()
        floor.destroy()
    end

    return {
        initialize = initialize,
        moveScenario = moveScenario,
        getFloor = getFloor,
        getRoof = getRoof,
        run = run,
        destroy = destroy
    }
end)()
