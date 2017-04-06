local callbackHell = require('src.obstacles.callback-hell.callback-hell')

return (function()

    local obstaclesMap = {
        callbackHell,
        callbackHell
    }

    local lastObstacle = {}

    local lastPosition = {}

    local positionMap = {
        top = display.screenOriginY,
        bottom = display.screenOriginY + display.contentHeight
    }

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

    return {
        sortPosition = sortPosition,
        sortObstacle = sortObstacle
    }
end)()