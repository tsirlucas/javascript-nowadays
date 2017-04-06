local callbackHell = require('src.obstacles.callback-hell.callback-hell')

local obstacles = display.newGroup()
local obstaclesTimer

local game
local firstCollision
local speed

local spawnLocation = display.screenOriginX + display.contentWidth

local positionMap = {
    top = display.screenOriginY,
    bottom = display.screenOriginY + display.contentHeight
}

local obstaclesMap = {
    callbackHell,
    callbackHell
}

local lastObstacle = {}

local lastPosition = {}

local visibleObstacles = display.newGroup()


local function sortPosition()
    local position = math.random(1, 2)
    while (position == lastPosition.first and position == lastPosition.second) do
        position = math.random(1, 2)
    end
    lastPosition.second = lastPosition.first
    lastPosition.first = position
    if (position == 1) then
        return { coordinate = positionMap.top, place = 'top' }
    else
        return { coordinate = positionMap.bottom, place = 'bottom' }
    end
end

local function sortObstacle()
    local obstacle = math.random(1, 2)
    while (obstacle == lastObstacle.first and obstacle == lastObstacle.second) do
        obstacle = math.random(1, 2)
    end
    lastObstacle.second = lastObstacle.first
    lastObstacle.first = obstacle
    return obstaclesMap[obstacle]
end

local function spam()
    local position = sortPosition()
    local obstacle = sortObstacle()
    visibleObstacles:insert(obstacle.spawn(event, spawnLocation, position.coordinate, speed, position.place))
end

function obstacles:startSpam(gameSpeed)
    speed = gameSpeed
    spam()
    obstaclesTimer = timer.performWithDelay(gameSpeed * 150, spam, -1)
end

function obstacles:destroy()
    timer.cancel(obstaclesTimer)
    for a = 1, visibleObstacles.numChildren, 1 do
        visibleObstacles[a].destroy()
    end
    display.remove(visibleObstacles)
    visibleObstacles = display.newGroup()
end

return obstacles