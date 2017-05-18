local composer = require("composer")
local score = require("src.score-service")

local gameOverScene = composer.newScene()
local playButtom
local gameTitle
local playerScore
local bestScore
local background

local scoreConfig = {
    fontSize = 100,
    font = "src/fonts/Digital_tech.otf",
    x = display.contentCenterX,
    y = display.contentCenterY,
    maxDigits = 7,
    leadingZeros = true,
    filename = "scorefile.json",
}

local function play()
    composer.gotoScene('src.game')
    composer.removeScene('src.scenes.game-over.game-over')
end

function gameOverScene:create(event)
    score.load()
    score.init(scoreConfig);
    local currentScore = score.get();
    local red = 0
    local green = 0
    local blue = 1
    local eventScore = event.params.score
    if (eventScore < 0) then
        eventScore = 0
    end
    if (not currentScore or (currentScore and eventScore > currentScore)) then
        score.set(eventScore);
        green = 1;
        blue = 0
    elseif (eventScore < currentScore) then
        red = 1
        blue = 0
    end

    background = display.newRect(0, 0, 5000, 5000)
    background:setFillColor(0)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    playButtom = display.newText('Play again', display.contentCenterX, display.contentCenterY + 200,
        "src/fonts/Digital_tech.otf", 100)
    playerScore = display.newText('Your score: ' .. eventScore, display.contentCenterX, display.contentCenterY - 200,
        "src/fonts/Digital_tech.otf", 100)
    bestScore = display.newText('Best score: ' .. currentScore, display.contentCenterX, display.contentCenterY - 100,
        "src/fonts/Digital_tech.otf", 100)

    playerScore:setFillColor(red, green, blue)

    playButtom:addEventListener("tap", play)
end

function gameOverScene:destroy(event)
    display.remove(background)
    display.remove(gameTitle)
    display.remove(playButtom)
    display.remove(playerScore)
    display.remove(bestScore)
end

gameOverScene:addEventListener('create', gameOverScene)
gameOverScene:addEventListener('destroy', gameOverScene)

return gameOverScene