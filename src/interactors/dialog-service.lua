return (function()

    local function scenarioCollision(element)
        print('Your character collided with the ' .. element)
    end

    local function obstacleCollision(element)
        print('Your character collided with the ' .. element)
    end

    local interactionsMap = {
        obstacleCollision = obstacleCollision,
        scenarioCollision = scenarioCollision
    }

    local function interact(type, element)
        print(type, element)
        local message = interactionsMap[type]
        message(element)
    end

    return {
        interact = interact
    }
end)()