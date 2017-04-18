local sortPowersService = require 'src.util.sort-powers-service'

return (function()
    local shouldSortPower = false
    local powersTimer
    local visiblePowers = display.newGroup()

    local setPowerPermission = function()
        shouldSortPower = true
    end

    local initialize = function()
        powersTimer = timer.performWithDelay(1000, setPowerPermission, -1)
    end

    local destroy = function()
        timer.cancel(powersTimer)
        shouldSortPower = false
        for a = 1, visiblePowers.numChildren, 1 do
            visiblePowers[1].destroy()
        end
        display.remove(visiblePowers)
        visiblePowers = display.newGroup()
    end

    local spawnPowers = function(x, y, speed, position)
        if (shouldSortPower) then
            shouldSortPower = false
            local power = sortPowersService.sortPower()
            visiblePowers:insert(power.spawn(x, y, speed, position))
        end

        return nil
    end

    return {
        initialize = initialize,
        destroy = destroy,
        spawnPowers = spawnPowers
    }
end)()