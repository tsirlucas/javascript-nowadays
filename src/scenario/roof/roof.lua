local physics = require 'physics'

return (function()

    local roofLevel = 0
    local tileSize = 60;
    local tilesAmount = 50;

    local blocks = display.newGroup()

    local function create()
        for a = 1, tilesAmount, 1 do
            local numGen = math.random(2)
            local newBlock

            if (numGen == 1) then
                newBlock = display.newImage('src/scenario/floor/images/1.png')

            elseif (numGen == 2) then
                newBlock = display.newImage('src/scenario/floor/images/1.png')
            end

            newBlock.name = ('roof')
            newBlock.id = a

            newBlock.x = (a * tileSize) - tileSize
            newBlock.y = roofLevel

            physics.addBody(newBlock, { density = 10, friction = 10, bounce = 10, filter = { groupIndex = -1 } })
            blocks:insert(newBlock)
        end
    end

    local function update(speed)
        for a = 1, blocks.numChildren, 1 do
            if ((blocks[a]).x < -100) then
                local newX
                if (a > 1) then
                    newX = (blocks[a - 1]).x + tileSize
                else
                    newX = (blocks[tilesAmount]).x + tileSize - speed
                end

                (blocks[a]).x, (blocks[a]).y = newX, roofLevel
            else
                (blocks[a]):translate(speed * -1, 0)
            end
        end
    end

    local function destroy()
        for a = 1, blocks.numChildren, 1 do
            display.remove(blocks[1])
        end
    end

    return {
        create = create,
        update = update,
        destroy = destroy
    }
end)()
