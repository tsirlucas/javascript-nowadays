local callbackHell = display.newGroup()

function callbackHell:spawn(x, y, speed, position)
    local obstacle = display.newImageRect('src/obstacles/callback-hell/images/callback-hell.png', 300, 400)
    obstacle.type = 'obstacle'
    obstacle.name = 'callback-hell'
    obstacle.x = x
    obstacle.y = position == 'top' and (y + 150) or (y - 150)
    local obstacleTimer

    local function move(event)
        obstacle.x = obstacle.x - (speed / 55)
        if (obstacle.x < -60) then
            timer.cancel(obstacleTimer)
            display.remove(obstacle)
        end
    end

    move()
    obstacleTimer = timer.performWithDelay(1, move, -1)
end

return callbackHell