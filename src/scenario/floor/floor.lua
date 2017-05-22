local physics = require 'physics'

local groundLevel = 800
local tileSize = 60;
local tilesAmount = 50;

return (function()

    local blocks

    local function create()
        blocks = display.newImageRect('src/scenario/floor/images/floor.png', display.actualContentWidth * 2, 100)
        blocks.y = display.actualContentHeight - 50
        physics.addBody(blocks, 'static', { density = 0, friction = 0, bounce = 0, filter = { groupIndex = -1 } })
    end

    local function update(speed)
    end

    local function destroy()
        display.remove(blocks)
    end

    return {
        create = create,
        update = update,
        destroy = destroy
    }
end)()
