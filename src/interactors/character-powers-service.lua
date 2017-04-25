local dialogService = require 'src.interactors.dialog-service'

return (function()

    local function trigger(event, game, objectName)
        local character
        local power
        if (event.object1.name == true) then
            character = event.object2
            power = event.object1
        else
            character = event.object1
            power = event.object2
        end
        character.powers[objectName] = true;

        timer.performWithDelay(1, function()
        power.destroy(power)
        end)

        dialogService.interact('obstacleCollision', objectName)
    end

    return {
        trigger = trigger
    }
end)()
