local sortService = require('src.util.sort-service')

return (function()

    local obstaclesMap = {
        'angular',
        'react',
        'vue',
        'webpack',
        'rollup',
        'npm',
        'yarn',
        'gulp',
        'typescript',
        'meteor',
        'preact',
        'inferno',
        'ember',
        'polymer',
        'redux',
        'mobx',
        'babel',
        'jquery',
        'leaflet',
        'eslint',
        'rxjs'
    }

    local lastObstacle = {}

    local lastPosition = {}

    local positionMap = {
        top = display.screenOriginY,
        bottom = display.screenOriginY + display.contentHeight
    }

    local function sortPosition()
        return math.random(display.contentWidth)
    end

    local function sortObstacle()
        local option = obstaclesMap[math.random(21)];
        print(option)
        lastObstacle = display.newImageRect('src/obstacles/images/' .. option .. '.png', 150, 150)
        physics.addBody(lastObstacle, { density = 0, friction = 0, bounce = 0, filter = { groupIndex = -2 } })
        lastObstacle.lib = true
        return lastObstacle
    end

    return {
        sortPosition = sortPosition,
        sortObstacle = sortObstacle
    }
end)()