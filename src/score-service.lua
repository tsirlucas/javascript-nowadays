local json = require "json"

return (function()
    local score
    local customOptions
    local opt
    local filename
    local prefix
    local format
    local scoreText
    local path
    local file
    local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )

    local function init(options)
        score = 0
        customOptions = options or {}
        opt = {}
        opt.fontSize = customOptions.fontSize or 24
        opt.font = customOptions.font or native.systemFontBold
        opt.x = customOptions.x or display.contentCenterX
        opt.y = customOptions.y or opt.fontSize * 0.5
        opt.maxDigits = customOptions.maxDigits or 6
        opt.leadingZeros = customOptions.leadingZeros or false
        filename = "scores.json"


        prefix = ""
        if (opt.leadingZeros) then
            prefix = "0"
        end
        format = "%" .. prefix .. opt.maxDigits .. "d"

--        scoreText = display.newText(string.format(format, 0), opt.x, opt.y, opt.font, opt.fontSize)
    end

    local function save()
        file = io.open(filePath, "w+")
        if (file) then
            local scoreObj = {value = score }
            file:write(json.encode( scoreObj ))
            io.close(file)
            return true
        else
            print("Error: could not read ", filename, ".")
            return false
        end
        file = nil
    end

    local function load()
        local contents = ""
        file = io.open(filePath, "r")
        if (file) then
            -- Read all contents of file into a string
            local contents = file:read('*a')
            print(contents)
            io.close(file)
            if(contents) then
                local score = json.decode( contents )
                return score.value
            else
                return 0
             end
        else
            print("Error: could not read scores from ", filename, ".")
        end
        return 0
    end

    local function set(value)
        score = value
        save()
    end

    local function get()
        return load()
    end

    local function add(amount)
        score = score + amount
    end

    return {
        init = init,
        get = get,
        set = set,
        add = add,
        save = save,
        load = load
    }
end)()