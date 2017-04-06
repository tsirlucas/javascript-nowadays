local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

return (function()

    local function trigger(event, game, objectName)
        dialogService.interact('scenarioCollision', objectName)
        event.contact.isEnabled = false
        game.stopPhysics()
        composer.gotoScene('src.scenes.game-over.game-over')
        composer.removeScene('src.game')
    end

    return {
        trigger = trigger
    }
end)()