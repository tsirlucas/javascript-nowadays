local composer = require("composer")

local menuScene = composer.newScene()
local playButtom
local gameTitle
local background

local function play()
    composer.gotoScene('src.game')
end

function menuScene:create(event)
    background = display.newImageRect('src/scenes/menu/images/hell.jpeg', display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    gameTitle = display.newText('Javascript Nowadays', display.contentCenterX, display.contentCenterY - 250,
        native.systemFont, 100)
    playButtom = display.newText('Play', display.contentCenterX, display.contentCenterY - 50,
        native.systemFont, 100)

    playButtom:addEventListener("tap", play)
end

menuScene:addEventListener("create", menuScene)

return menuScene