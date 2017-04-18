local callbackHell = require('src.obstacles.callback-hell.callback-hell')
local sortService = require('src.util.sort-service')

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
        local position = sortService.sortPosition(positionMap, 2, lastPosition)
        lastPosition = position.lastPosition
        return position
    end

    local function sortObstacle()
        local obstacle = sortService.sortElement(obstaclesMap, 2, lastObstacle)
        lastObstacle = obstacle.lastElement
        return obstacle.content
    end

    return {
        sortPosition = sortPosition,
        sortObstacle = sortObstacle
    }
end)()