local composer = require('composer')

local menuScene = composer.newScene()
local playButtom
local gameTitle
local background
local backgroundMusicChannel
local backgroundColor

local musicOptions =
{
    channel = 1,
    loops = -1,
    onComplete = callbackListener
}

local backgroundMusic = audio.loadStream( "src/scenes/menu/Aestate.mp3" )

local function play()
    composer.gotoScene('src.game')
    composer.removeScene('src.scenes.menu.menu')
end

function menuScene:create()
    backgroundMusicChannel = audio.play(backgroundMusic, musicOptions)
    backgroundColor =  display.newRect(0, 0, 5000, 5000);
    backgroundColor:setFillColor(1, 1, 1);
    background = display.newImageRect("assets/xablau-js.png",  display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    playButtom = display.newText('Play', display.contentCenterX, display.contentCenterY + 350,
        "src/fonts/Digital_tech.otf", 100)

    playButtom:addEventListener('tap', play)
end

function menuScene:destroy()
    display.remove(backgroundColor)
    display.remove(background)
    display.remove(playButtom)
    audio.stop(backgroundMusicChannel)
end

menuScene:addEventListener('create', menuScene)
menuScene:addEventListener('destroy', menuScene)

return menuScene