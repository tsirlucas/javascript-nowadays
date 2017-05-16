local dialogService = require 'src.interactors.dialog-service'
local getCollisionsElements = require 'src.util.get-collisions-elements'

return (function()

    local function trigger(event, game, objectName, incrementScore, incrementeSpeed)
        getCollisionsElements(event, (function(lib, character)
            print('colisao lib char')
            incrementScore(5)
            incrementeSpeed(-5)
            timer.performWithDelay(1, function()
                lib.destroy(lib)
            end)
        end))
    end

    return {
        trigger = trigger
    }
end)()
