local background = require 'src.scenario.background.background'
local floor = require 'src.scenario.floor.floor'
local roof = require 'src.scenario.roof.roof'

local scenario = display.newGroup()
local speed;
local scenarioTimer

function scenario:initialize(initialSpeed)
    speed = initialSpeed
    background.create();
    floor.create();
    roof.create();
    scenario.run()
end

function scenario:moveScenario()
    background.update(event, speed)
    roof.update(event, speed / 15)
    floor.update(event, speed / 15)
end

function scenario:getFloor()
    return floor
end

function scenario:getRoof()
    return roof
end

function scenario:run()
    scenarioTimer = timer.performWithDelay(1, scenario.moveScenario, -1)
end

function scenario.destroy()
    timer.cancel(scenarioTimer)
    background.destroy()
    roof.destroy()
    floor.destroy()
    display.remove(scenario)
end

return scenario
