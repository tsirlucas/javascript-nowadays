local sortObstaclesService = require 'src.util.sort-obstacles-service'
local powers = require('src.powers.powers')

local game
local speed

local obstaclesTimer

local spawnLocation = display.screenOriginX + display.contentWidth
local visibleObstacles = display.newGroup()

return (function()

    local function spawn()
        local position = sortObstaclesService.sortPosition()
        local obstacle = sortObstaclesService.sortObstacle()
        powers.spawnPowers(spawnLocation, position.coordinate, speed, position.place)
        visibleObstacles:insert(obstacle.spawn(spawnLocation, position.coordinate, speed, position.place))
    end

    local function startSpam(gameSpeed)
        powers.initialize(gameSpeed)
        speed = gameSpeed
        spawn()
        obstaclesTimer = timer.performWithDelay(gameSpeed * 150, spawn, -1)
    end

    local function destroy()
        powers.destroy()
        timer.cancel(obstaclesTimer)
        for a = 1, visibleObstacles.numChildren, 1 do
            visibleObstacles[1].destroy()
        end
        display.remove(visibleObstacles)
        visibleObstacles = display.newGroup()
    end

    return {
        startSpam = startSpam,
        destroy = destroy
    }
end)()