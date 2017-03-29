local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

local characterScenario = display.newGroup()
local game
local firstCollision

local function onCollision(event)
    if (firstCollision and event.phase == 'began') then
        dialogService.interact(event, 'collision', event.object1.name)
        event.contact.isEnabled = false
        game.stopPhysics()
        composer.gotoScene('src.scenes.game-over.game-over')
        composer.removeScene('src.game')
        firstCollision = false;
    end
end

function characterScenario:watchCollisions(gameScene)
    firstCollision = true;
    game = gameScene
    Runtime:addEventListener('collision', onCollision)
end

function characterScenario:stopWatching()
    Runtime:removeEventListener('collision', onCollision)
end

return characterScenario