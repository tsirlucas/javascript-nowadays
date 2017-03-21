local dialogService = require 'src.interactions.dialog-service'
local composer = require 'composer'

local characterScenario = display.newGroup()

local function onCollision(event)
    if (event.phase == "began") then
        dialogService.interact(event, 'collision', event.object2.name)
        composer.gotoScene('src.scenes.game-over.game-over')
    end
end

function characterScenario:watchCollisions()
    Runtime:addEventListener('collision', onCollision)
end

return characterScenario