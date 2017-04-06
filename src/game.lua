local physics = require 'physics'
local scenario = require 'src.scenario.scenario'
local character = require 'src.character.character'
local joystick = require 'src.joystick'
local characterJoystickService = require 'src.interactions.character-joystick-service'
local interactionsService = require 'src.interactions.interactions-service'
local composer = require('composer')
local obstacles = require('src.obstacles.obstacles')

local gameScene = composer.newScene()
local group

local gameSpeed = 50

function gameScene:create(event)
    physics.start()
    physics.setGravity(0, 0)

    scenario.initialize(event, gameSpeed)
    character.create()
    obstacles.startSpam(event, gameSpeed)

    characterJoystickService.initialize(event, character, joystick)
    interactionsService.watchCollisions(event, gameScene)
end

function gameScene:stopPhysics(event)
    physics.pause()
end

function gameScene:destroy(event)
    character.destroy()
    interactionsService.stopWatching()
    scenario.destroy()
    joystick.destroy()
    obstacles.destroy()
end


gameScene:addEventListener('create', gameScene)
gameScene:addEventListener('destroy', gameScene)

return gameScene