local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

local characterScenario = display.newGroup()

function characterScenario:trigger(event, game)
    dialogService.interact(event, 'collision', event.object1.name)
    event.contact.isEnabled = false
    game.stopPhysics()
    composer.gotoScene('src.scenes.game-over.game-over')
    composer.removeScene('src.game')
end

return characterScenario