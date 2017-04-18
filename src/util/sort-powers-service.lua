local promises = require('src.powers.promises.promises')
local sortService = require('src.util.sort-service')

return (function()

    local powersMap = {
        promises,
        promises
    }

    local lastPower = {}

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

    local function sortPower()
        local power = sortService.sortElement(powersMap, 2, lastPower)
        lastPower = power.lastElement
        return power.content
    end

    return {
        sortPosition = sortPosition,
        sortPower = sortPower
    }
end)()