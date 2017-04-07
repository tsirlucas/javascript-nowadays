local characterScenarioService = require 'src.interactors.character-scenario-service'
local characterObstaclesService = require 'src.interactors.character-obstacles-service'

return (function()

    local game
    local firstCollision

    local interactorsMap = {
        roof = characterScenarioService,
        floor = characterScenarioService,
        callbackHell = characterObstaclesService
    }

    local function _callInteractor(event)
        local object = true and event.object1.name or event.object2.name
        local interactor = interactorsMap[object]
        interactor.trigger(event, game, object)
        firstCollision = false
    end

    local function _onCollision(event)
        if (firstCollision and event.phase == 'began') then
            _callInteractor(event)
        elseif (event.phase == 'ended') then
            firstCollision = false
        end
    end

    local function watchCollisions(gameScene)
        firstCollision = true
        game = gameScene
        Runtime:addEventListener('collision', _onCollision)
    end

    local function stopWatching()
        Runtime:removeEventListener('collision', _onCollision)
    end

    return {
        watchCollisions = watchCollisions,
        stopWatching = stopWatching
    }

end)()
