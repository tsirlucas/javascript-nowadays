local background = display.newRect(0, 0, 5000, 5000)
local backgroundBigCloud1 = display.newImage("src/scenario/background/images/cloud1@2x.png")
local backgroundBigCloud2 = display.newImage("src/scenario/background/images/cloud5@2x.png")
local backgroundBigCloud3 = display.newImage("src/scenario/background/images/cloud1@2x.png")
local backgroundLittleCloud1 = display.newImage("src/scenario/background/images/cloud2.png")
local backgroundLittleCloud2 = display.newImage("src/scenario/background/images/cloud3.png")
local backgroundLittleCloud3 = display.newImage("src/scenario/background/images/cloud4.png")

function background:create()
    background.fill = {
        type = 'gradient',
        color1 = { 0.2, 0.45, 0.8 },
        color2 = { 0.7, 0.8, 1 }
    }

    backgroundBigCloud1.x = 600
    backgroundBigCloud1.y = 200

    backgroundBigCloud2.x = 1000
    backgroundBigCloud2.y = 300

    backgroundBigCloud3.x = 200
    backgroundBigCloud3.y = 400

    backgroundLittleCloud1.x = 200
    backgroundLittleCloud1.y = 160

    backgroundLittleCloud2.x = 450
    backgroundLittleCloud2.y = 360

    backgroundLittleCloud3.x = 1000
    backgroundLittleCloud3.y = 60
end

function background:update(speed)
    backgroundBigCloud1.x = backgroundBigCloud1.x - (speed / 55)
    if(backgroundBigCloud1.x < -60) then
        backgroundBigCloud1.x = 1500
    end
    backgroundBigCloud2.x = backgroundBigCloud2.x - (speed / 55)
    if(backgroundBigCloud2.x < -60) then
        backgroundBigCloud2.x = 1500
    end
    backgroundBigCloud3.x = backgroundBigCloud3.x - (speed / 55)
    if(backgroundBigCloud3.x < -60) then
        backgroundBigCloud3.x = 1500
    end
    backgroundLittleCloud1.x = backgroundLittleCloud1.x - (speed / 55)
    if(backgroundLittleCloud1.x < -60) then
        backgroundLittleCloud1.x = 1500
    end
    backgroundLittleCloud2.x = backgroundLittleCloud2.x - (speed / 55)
    if(backgroundLittleCloud2.x < -60) then
        backgroundLittleCloud2.x = 1500
    end
    backgroundLittleCloud3.x = backgroundLittleCloud3.x - (speed / 55)
    if(backgroundLittleCloud3.x < -60) then
        backgroundLittleCloud3.x = 1500
    end
end

return background