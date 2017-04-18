local physics = require 'physics'

return (function()

    local function spawn(x, y, speed, position)
        local power = display.newImageRect('src/powers/promises/images/promises.png', 150, 400)
        power.type = 'powers'
        power.name = 'promises'
        power.x = x + 70
        power.y = position == 'top' and (y + 150) or (y - 150)
        physics.addBody(power, { density = 10, friction = 10, bounce = 10, filter = { groupIndex = -1 } })
        local powerTimer

        local function move(event)
            power.x = power.x - (speed / 55)
            if (power.x < -60) then
                timer.cancel(powerTimer)
                physics.removeBody(power)
                display.remove(power)
            end
        end

        function power:destroy(event)
            timer.cancel(powerTimer)
            display.remove(power)
        end

        function power:getBenefit(event)
            return 'benefit?'
        end

        move()
        powerTimer = timer.performWithDelay(1, move, -1)
        return power
    end

    return {
        spawn = spawn
    }
end)()
