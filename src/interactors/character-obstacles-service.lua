local dialogService = require 'src.interactors.dialog-service'
local getCollisionsElements = require 'src.util.get-collisions-elements'
local composer = require 'composer'

return (function()

    local function trigger(event, game, objectName)
        getCollisionsElements(event, (function(character, obstacle)
            if (not character.powers[obstacle.counter]) then
                dialogService.interact('obstacleCollision', objectName)
                event.contact.isEnabled = false
                game.stopPhysics()
                composer.gotoScene('src.scenes.game-over.game-over')
                composer.removeScene('src.game')
            else
                timer.performWithDelay(1, function()
                    obstacle.destroy()
                    character.powers[obstacle.counter] = nil
                end)
            end
        end))
    end

    return {
        trigger = trigger
    }
end)()
