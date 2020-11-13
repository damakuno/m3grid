local Grid = {}

function Grid:new(grid, object)
    object =
        object or
        {
            grid = grid
        }

    math.randomseed(os.clock() * 100000000000)
    for i = 1, 3 do
        math.random()
    end

    setmetatable(object, self)
    self.__index = self
    return object
end

function Grid:update(dt)
end

function Grid:draw()
end

function Grid:fill()
    print("\n")
    local hasMatches = false
    repeat
        for i, row in ipairs(self.grid) do
            for j, col in ipairs(row) do
                self.grid[i][j] = randomInt(1, 5)
            end
        end
        h, v = self:checkMatch(self.grid)
        if (#h > 0 or #v > 0) then
            hasMatches = true
        else
            hasMatches = false
        end
        print(#h, #v)
    until (hasMatches == false)
    for i, row in ipairs(self.grid) do
        local rowVals = ""
        for j, col in ipairs(row) do
            rowVals = rowVals .. self.grid[i][j]
        end
        print(rowVals)
    end
end

function Grid:checkMatch()
    local vMatches = {}
    local hMatches = {}
    local grid = self.grid
    local prevRows = {}
    local rowCounts = {}
    for i, row in ipairs(grid) do
        local prevCol = 0
        local colCount = 0
        for j, col in ipairs(row) do
            if prevRows[j] == nil then
                prevRows[j] = 0
                rowCounts[j] = 0
            end
            if col ~= prevCol then
                colCount = 1
            else
                colCount = colCount + 1
                if colCount >= 3 then
                    for h = 1, colCount do
                        table.insert(hMatches, {j - h + 1, i})
                    end
                end
            end
            prevCol = col
            -- print(col, colCount)

            if col ~= prevRows[j] then
                rowCounts[j] = 1
            else
                rowCounts[j] = rowCounts[j] + 1
                if rowCounts[j] >= 3 then
                    for k = 1, rowCounts[j] do
                        table.insert(vMatches, {j, i - k + 1})
                    end
                end
            end
            prevRows[j] = col
            -- print(col, rowCounts[j])
        end
    end

    return hMatches, vMatches
end

function randomInt(start, length)
    return math.floor(math.random() * length + start)
end

return Grid
