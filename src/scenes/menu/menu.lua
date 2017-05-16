local composer = require('composer')

local menuScene = composer.newScene()
local playButtom
local gameTitle
local background
local backgroundMusicChannel

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
    background = display.newRect(0, 0, 5000, 5000)
    background:setFillColor( 0 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    gameTitle = display.newText('Javascript Nowadays', display.contentCenterX, display.contentCenterY - 250,
        "src/fonts/Digital_tech.otf", 100)
    playButtom = display.newText('Play', display.contentCenterX, display.contentCenterY - 50,
        "src/fonts/Digital_tech.otf", 100)

    playButtom:addEventListener('tap', play)
end

function menuScene:destroy()
    display.remove(background)
    display.remove(gameTitle)
    display.remove(playButtom)
    audio.stop(backgroundMusicChannel)
end

menuScene:addEventListener('create', menuScene)
menuScene:addEventListener('destroy', menuScene)

return menuScene