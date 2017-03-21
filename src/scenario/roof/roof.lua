local physics = require 'physics'

local blocks = display.newGroup()

--setup some variables that we will use to position the ground

local roofLevel = 0
local tileSize = 60;
local tilesAmount = 50;

function blocks:create()
    --this for loop will generate all of your ground pieces, we are going to
    --make 100 in all.
    for a = 1, tilesAmount, 1 do
        --get a random number between 1 and 2, this is what we will use to decide which
        --texture to use for our ground sprites. Doing this will give us random ground
        --pieces so it seems like the ground goes on forever. You can have as many different
        --textures as you want. The more you have the more random it will be, just remember to
        --up the number in math.random(x) to however many textures you have.
        local numGen = math.random(2)
        local newBlock

        if(numGen == 1) then
            newBlock = display.newImage("src/scenario/floor/images/1.png")

        elseif(numGen == 2) then
            newBlock = display.newImage("src/scenario/floor/images/1.png")
        end

        --now that we have the right image for the block we are going
        --to give it some member variables that will help us keep track
        --of each block as well as position them where we want them.
        newBlock.name = ("roof")
        newBlock.id = a

        --because a is a variable that is being changed each run we can assign
        --values to the block based on a. In this case we want the x position to
        --be positioned the width of a block apart.
        newBlock.x = (a * tileSize) - tileSize
        newBlock.y = roofLevel

        physics.addBody( newBlock, 'static' )
        blocks:insert(newBlock)
    end
end


function blocks:update(speed)
    for a = 1, blocks.numChildren, 1 do
        if((blocks[a]).x < -100) then
            local newX
            if(a > 1) then
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

return blocks
