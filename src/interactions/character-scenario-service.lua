local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

local characterScenario = display.newGroup()

function characterScenario:trigger(event, game, objectName)
    dialogService.interact(event, 'scenarioCollision', objectName)
    event.contact.isEnabled = false
    game.stopPhysics()
    composer.gotoScene('src.scenes.game-over.game-over')
    composer.removeScene('src.game')
end

return characterScenario