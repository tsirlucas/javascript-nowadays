local scenario = require "src.scenario.scenario"
local character = require "src.character.character"
local joystick = require "src.joystick"
local characterJoystickService = require "src.interactions.character-joystick-service"
local characterFloorService = require "src.interactions.character-floor-service"

character.create()
scenario.initialize(event, 50)

characterJoystickService.initialize(event, character, joystick)
characterFloorService.watchCollisions(event, character, scenario.getFloor())