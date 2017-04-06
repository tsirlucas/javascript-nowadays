local characterScenarioService = require 'src.interactions.character-scenario-service'
local characterObstaclesService = require 'src.interactions.character-obstacles-service'

local interactions = display.newGroup()

local game
local firstCollision

local interactorsMap = {
    roof = characterScenarioService,
    floor = characterScenarioService,
    callbackHell = characterObstaclesService
}

local function callInteractor(event)
    local object = true and event.object1.name or event.object2.name
    local interactor = interactorsMap[object]
    interactor.trigger(event, event, game, object)
    firstCollision = false
end

local function onCollision(event)
    if (firstCollision and event.phase == 'began') then
        callInteractor(event)
    elseif (event.phase == 'ended') then
        firstCollision = false
    end
end

function interactions:watchCollisions(gameScene)
    firstCollision = true
    game = gameScene
    Runtime:addEventListener('collision', onCollision)
end

function interactions:stopWatching()
    Runtime:removeEventListener('collision', onCollision)
end

return interactions