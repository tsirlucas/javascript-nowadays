local physics = require 'physics'

local characterElement
local moveSpeed = 150;

return (function()
    local moveTransition

    local stoped = graphics.newImageSheet("src/character/images/char-stopped.png", {
        width = 150,
        height = 172,
        numFrames = 8,
    })

    local runningRight = graphics.newImageSheet("src/character/images/char-running-right.png", {
        width = 195,
        height = 172.5,
        numFrames = 8
    })

    local runningLeft = graphics.newImageSheet("src/character/images/char-running-left.png", {
        width = 195,
        height = 172.5,
        numFrames = 8
    })

    local sequenceData = {
        {
            name = "stoped",
            sheet = stoped,
            start = 1,
            count = 8,
            time = 800,
            loopCount = 0
        },
        {
            name = "running_right",
            sheet = runningRight,
            start = 1,
            count = 8,
            time = 800,
            loopCount = 0
        },
        {
            name = "running_left",
            sheet = runningLeft,
            start = 1,
            count = 8,
            time = 800,
            loopCount = 0
        }
    }

    local function create()

        characterElement = display.newSprite(stoped, sequenceData)
        characterElement.x = 150
        characterElement.y = display.contentHeight - 115
        characterElement:setSequence('stoped')
        characterElement:play()
        characterElement.char = true
        physics.addBody(characterElement, "static", { density = 0, friction = 0, bounce = 0 })
    end

    local function move(direction)
        if (characterElement.x and direction >= 0 and direction < display.contentWidth) then
            if (direction > characterElement.x) then
                characterElement:setSequence('running_right')
                characterElement:play()
                characterElement.y = display.contentHeight - 115
            elseif (direction < characterElement.x) then
                characterElement:setSequence('running_left')
                characterElement:play()
                characterElement.y = display.contentHeight - 115
            end
            moveTransition = transition.to(characterElement, {
                x = direction
            })
        end
    end

    local function stopMoving()
        transition.cancel(moveTransition)
        characterElement:setSequence('stoped')
        characterElement:play()
        characterElement.y = display.contentHeight - 115
    end

    local function destroy()
        display.remove(characterElement)
    end

    return {
        create = create,
        move = move,
        stopMoving = stopMoving,
        destroy = destroy
    }
end)()
