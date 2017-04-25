local dialogService = require 'src.interactors.dialog-service'
local getCollisionsElements = require 'src.util.get-collisions-elements'

return (function()

    local function trigger(event, game, objectName)
        getCollisionsElements(event, (function(character, power)
            character.powers[objectName] = true;

            timer.performWithDelay(1, function()
                power.destroy(power)
            end)

            dialogService.interact('obstacleCollision', objectName)
        end))
    end

    return {
        trigger = trigger
    }
end)()
