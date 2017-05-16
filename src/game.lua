local physics = require 'physics'
local scenario = require 'src.scenario.scenario'
local character = require 'src.character.character'
local touchpad = require 'src.touchpad'
local characterTouchpadService = require 'src.interactors.character-touchpad-service'
local interactionsService = require 'src.interactors.interactions-service'
local composer = require('composer')
local obstacles = require('src.obstacles.obstacles')

local gameScene = composer.newScene()
local group

local gameSpeed = 50

local gameScore
local gameScoreElement
local gameScoreTimer
local scorePosition = {
    x = display.screenOriginX + display.contentWidth - 150,
    y = display.screenOriginY + 120
}

local backgroundMusicChannel

local musicOptions =
{
    channel = 1,
    loops = -1,
    onComplete = callbackListener
}

local backgroundMusic = audio.loadStream( "src/ente_evil.mp3" )

local function incrementScore(value)
    backgroundMusicChannel = audio.play(backgroundMusic, musicOptions)
    gameScore = gameScore + value;
    display.remove(gameScoreElement)
    gameScoreElement = display.newText(gameScore, scorePosition.x, scorePosition.y,
        "src/fonts/Digital_tech.otf", 70)

    if(gameScore < 0) then
        composer.gotoScene('src.scenes.game-over.game-over')
        composer.removeScene('src.game')
    end
end

function gameScene:create(event)
    local scenarioGroup = self.view
    scenarioGroup:toBack()

    physics.start()
    physics.setGravity()
    obstacles.startSpam(gameSpeed)
    scenario.initialize(scenarioGroup, gameSpeed)
    character.create()
    characterTouchpadService.setCharacter(character);
    touchpad.start(characterTouchpadService.interact)
    interactionsService.watchCollisions(gameScene, incrementScore, obstacles)
    gameScore = 0
    gameScoreElement = display.newText(gameScore, scorePosition.x, scorePosition.y,
        native.systemFont, 70)

end

function gameScene:stopPhysics(event)
    physics.pause()
end

function gameScene:destroy(event)
    character.destroy()
    interactionsService.stopWatching()
    scenario.destroy()
    obstacles.destroy()
    touchpad.stop()
    display.remove(gameScoreElement)
    audio.stop(backgroundMusicChannel)
end


gameScene:addEventListener('create', gameScene)
gameScene:addEventListener('destroy', gameScene)

return gameScene