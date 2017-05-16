return (function()

    local background
    local backgroundBigCloud1
    local backgroundBigCloud2
    local backgroundBigCloud3
    local backgroundLittleCloud1
    local backgroundLittleCloud2
    local backgroundLittleCloud3

    local function create(group)
        background = display.newImageRect("src/scenario/background/images/hell-background.jpg",  display.actualContentWidth, display.actualContentHeight)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        group:insert(background)

    end

    local function update(speed)

    end

    local function destroy()

    end

    return {
        create = create,
        update = update,
        destroy = destroy
    }
end)()