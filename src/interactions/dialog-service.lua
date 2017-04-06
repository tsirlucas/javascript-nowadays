local dialog = display.newGroup()

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

function dialog:interact(type, element)
    local message = interactionsMap[type]
    message(element)
end

return dialog