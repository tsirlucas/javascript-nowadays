local sortObstaclesService = require 'src.util.sort-obstacles-service'

local obstacles = display.newGroup()
local obstaclesTimer

local game
local firstCollision
local speed

local spawnLocation = display.screenOriginX + display.contentWidth

local visibleObstacles = display.newGroup()

return (function()

    local function spam()
        local position = sortObstaclesService.sortPosition()
        local obstacle = sortObstaclesService.sortObstacle()
        visibleObstacles:insert(obstacle.spawn(spawnLocation, position.coordinate, speed, position.place))
    end

    local function startSpam(gameSpeed)
        speed = gameSpeed
        spam()
        obstaclesTimer = timer.performWithDelay(gameSpeed * 150, spam, -1)
    end

    local function destroy()
        timer.cancel(obstaclesTimer)
        for a = 1, visibleObstacles.numChildren, 1 do
            visibleObstacles[a].destroy()
        end
        display.remove(visibleObstacles)
        visibleObstacles = display.newGroup()
    end

    return {
        startSpam = startSpam,
        destroy = destroy
    }
end)()