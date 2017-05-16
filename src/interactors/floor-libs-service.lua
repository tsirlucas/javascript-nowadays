local dialogService = require 'src.interactors.dialog-service'
local getCollisionsElements = require 'src.util.get-collisions-elements'
local composer = require 'composer'

return (function()

    local function trigger(event, game, objectName, incrementScore, incrementeSpeed)
        getCollisionsElements(event, (function(lib, floor)
            print('colisao lib floor')
            incrementeSpeed(3)
            timer.performWithDelay(1, function()
                incrementScore(-3)
                lib.destroy(lib)
            end)
        end))
    end

    return {
        trigger = trigger
    }
end)()
