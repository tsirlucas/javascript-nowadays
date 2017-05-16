return (function()
    local listener
    local screen
    local cb

    local function start(callback)
        cb = callback
        screen = display.newRect(0, 0, 5000, 5000)
        screen.isVisible = false
        screen.isHitTestable = true
        listener = screen:addEventListener("touch", callback)
    end

    local function stop()
        screen:removeEventListener("touch", cb)
    end

    return {
        start = start,
        stop = stop
    }
end)()