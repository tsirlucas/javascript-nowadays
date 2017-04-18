return (function()

    local function sortPosition(positionMap, mapSize, lastPosition)
        local position = math.random(1, mapSize)
        while (position == lastPosition.first and position == lastPosition.second) do
            position = math.random(1, mapSize)
        end
        lastPosition.second = lastPosition.first
        lastPosition.first = position
        if (position == 1) then
            return { coordinate = positionMap.top, place = 'top', lastPosition = lastPosition }
        else
            return { coordinate = positionMap.bottom, place = 'bottom', lastPosition = lastPosition }
        end
    end

    local function sortElement(ElementMap, mapSize, lastElement)
        local element = math.random(1, mapSize)
        while (element == lastElement.first and element == lastElement.second) do
            element = math.random(1, mapSize)
        end
        lastElement.second = lastElement.first
        lastElement.first = element
        return { content = ElementMap[element], lastElement = lastElement }
    end

    return {
        sortPosition = sortPosition,
        sortElement = sortElement
    }
end)()