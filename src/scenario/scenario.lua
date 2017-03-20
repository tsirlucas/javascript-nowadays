local background = require "src.scenario.background.background"
local floor = require "src.scenario.floor.floor"

local scenario = display.newGroup()
local speed;

function scenario:initialize(initialSpeed)
    speed = initialSpeed
    background.create();
    floor.create();
    scenario.run()
end

function scenario:moveScenario()
    background.update(event, speed)
    floor.update(event, speed / 15)
end

function scenario:getFloor()
    return floor
end

function scenario:run()
    timer.performWithDelay(1, scenario.moveScenario, -1)
end

return scenario
