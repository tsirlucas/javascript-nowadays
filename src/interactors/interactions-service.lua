local floorLibsService = require 'src.interactors.floor-libs-service'
local characterLibsService = require 'src.interactors.character-libs-service'

return (function()

    local game
    local firstCollision
    local incrementScore
    local incrementSpeed

    local interactorsMap = {
        character = characterLibsService,
        floor = floorLibsService
    }

    local function _callInteractor(event)
        if (event.object1.lib or event.object2.lib) then
            if (event.object1.char or event.object2.char) then
                local object = 'character'
                local interactor = interactorsMap[object]
                interactor.trigger(event, game, object, incrementScore, incrementSpeed)
                firstCollision = false
            else
                local object = 'floor'
                local interactor = interactorsMap[object]
                interactor.trigger(event, game, object, incrementScore, incrementSpeed)
                firstCollision = false
            end
        end
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

    local function watchCollisions(gameScene, increment, obstacles)
        incrementScore = increment
        incrementSpeed = obstacles.incrementSpeed
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
