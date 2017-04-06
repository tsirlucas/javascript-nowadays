local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

local characterObstacles = display.newGroup()

function characterObstacles:trigger(event, game, objectName)
    dialogService.interact(event, 'obstacleCollision', objectName)
    event.contact.isEnabled = false
    game.stopPhysics()
    composer.gotoScene('src.scenes.game-over.game-over')
    composer.removeScene('src.game')
end

return characterObstacles