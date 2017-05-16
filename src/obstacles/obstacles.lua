local sortObstaclesService = require 'src.util.sort-obstacles-service'
local physics = require('physics')

local game
local speed

local obstaclesTimer

local spawnLocation = display.screenOriginX + display.contentWidth
local visibleObstacles = display.newGroup()

return (function()

    local function spawn()
        local position = sortObstaclesService.sortPosition()
        local obstacle = sortObstaclesService.sortObstacle()
        obstacle.x = position
        obstacle.y = 0
        obstacle.destroy = function(obstacle)
            if (obstacle) then
                physics.removeBody(obstacle)
                display.remove(obstacle)
            end
        end
        visibleObstacles:insert(obstacle)
    end

    local function incrementSpeed(value)
        if (speed > 10) then
            speed = speed + value
            timer.cancel(obstaclesTimer)
            timer.performWithDelay(1, function()
                print(speed)
                obstaclesTimer = timer.performWithDelay(speed * 50, spawn, -1)
            end)
        end
    end

    local function startSpam(gameSpeed)
        speed = gameSpeed
        spawn()
        obstaclesTimer = timer.performWithDelay(gameSpeed * 50, spawn, -1)
    end

    local function destroy()
        timer.cancel(obstaclesTimer)
        timer.performWithDelay(1, function()
            display.remove(visibleObstacles)
            visibleObstacles = display.newGroup()
        end)
    end

    return {
        startSpam = startSpam,
        destroy = destroy,
        incrementSpeed = incrementSpeed
    }
end)()