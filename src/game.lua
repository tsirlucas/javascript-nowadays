local physics = require 'physics'
local scenario = require "src.scenario.scenario"
local character = require "src.character.character"
local joystick = require "src.joystick"
local characterJoystickService = require "src.interactions.character-joystick-service"
local characterScenarioService = require "src.interactions.character-scenario-service"

local composer = require("composer")

local gameScene = composer.newScene()

function gameScene:create(event)
    physics.start()
    physics.setGravity(0, 0)
    character.create()
    scenario.initialize(event, 50)

    characterJoystickService.initialize(event, character, joystick)
end

function gameScene:show(event)
    characterScenarioService.watchCollisions(event)
end

function gameScene:destroy(event)
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
end

gameScene:addEventListener("create", gameScene)
gameScene:addEventListener("show", gameScene)
gameScene:addEventListener("destroy", gameScene)

return gameScene