local composer = require("composer")

local gameOverScene = composer.newScene()
local playButtom
local gameTitle
local background

local function play()
    composer.gotoScene('src.game')
    composer.removeScene('src.scenes.game-over.game-over')
end

function gameOverScene:create(event)
    background = display.newImageRect('src/scenes/game-over/images/game-over.jpg', display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    gameTitle = display.newText('You lose', display.contentCenterX, display.contentCenterY - 100,
        native.systemFont, 100)
    playButtom = display.newText('Play again', display.contentCenterX, display.contentCenterY,
        native.systemFont, 100)

    playButtom:addEventListener("tap", play)
end

function gameOverScene:destroy(event)
    display.remove(background)
    display.remove(gameTitle)
    display.remove(playButtom)
end

gameOverScene:addEventListener('create', gameOverScene)
gameOverScene:addEventListener('destroy', gameOverScene)

return gameOverScene