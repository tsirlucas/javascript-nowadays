local physics = require 'physics'

local callbackHell = display.newGroup()

function callbackHell:spawn(x, y, speed, position)
    local obstacle = display.newImageRect('src/obstacles/callback-hell/images/callback-hell.png', 500, 400)
    obstacle.type = 'obstacle'
    obstacle.name = 'callbackHell'
    obstacle.x = x + 70
    obstacle.y = position == 'top' and (y + 150) or (y - 150)
    physics.addBody( obstacle, { density = 10, friction = 10, bounce = 10, filter = { groupIndex = -1 } }  )
    local obstacleTimer

    local function move(event)
        obstacle.x = obstacle.x - (speed / 55)
        if (obstacle.x < -60) then
            timer.cancel(obstacleTimer)
            physics.removeBody(obstacle)
            display.remove(obstacle)
        end
    end

    function obstacle:destroy(event)
        timer.cancel(obstacleTimer)
        display.remove(obstacle)
    end

    move()
    obstacleTimer = timer.performWithDelay(1, move, -1)
    return obstacle
end

return callbackHell