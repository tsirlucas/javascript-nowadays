local composer = require("composer")

local gameOverScene = composer.newScene()
local playButtom
local gameTitle
local background

local function play()
    composer.gotoScene('src.game')
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

gameOverScene:addEventListener("create", gameOverScene)

return gameOverScene