local characterScenarioService = require 'src.interactors.character-scenario-service'
local characterObstaclesService = require 'src.interactors.character-obstacles-service'
local characterPowersService = require 'src.interactors.character-powers-service'

return (function()

    local game
    local firstCollision

    local interactorsMap = {
        roof = characterScenarioService,
        floor = characterScenarioService,
        callbackHell = characterObstaclesService,
        promises = characterPowersService
    }

    local function _callInteractor(event)
        local object = true and event.object1.name or event.object2.name
        local interactor = interactorsMap[object]
        interactor.trigger(event, game, object)
        firstCollision = false
    end

    local function _onCollision(event)
        print(firstCollision)
        if (firstCollision and event.phase == 'began') then
            _callInteractor(event)
        elseif (event.phase == 'ended') then
            firstCollision = false
        end

        timer.performWithDelay(5, function()
            firstCollision = true
        end)
    end

    local function watchCollisions(gameScene)
        firstCollision = true
        game = gameScene
        print(firstCollision)
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
