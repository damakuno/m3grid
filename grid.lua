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

    for i, row in ipairs(object.grid) do
        local rowVals = ""
        for j, col in ipairs(row) do
            object.grid[i][j] = randomInt(1, 5)
            rowVals = rowVals .. object.grid[i][j]
        end
        print(rowVals)
    end
    setmetatable(object, self)
    self.__index = self
    return object
end

function Grid:update(dt)
end

function Grid:draw()
end

function Grid:checkMatch()
    local vMatches = {}
    local hMatches = {}
    local grid = self.grid
    local prevCol = 0
    local colCount = 0
    local prevRows = {}
    local rowCounts = {}
    for i, row in ipairs(grid) do
        print("\n")
        for j, col in ipairs(row) do
            if prevRows[j] == nil then
                prevRows[j] = 0
                rowCounts[j] = 0
            end
            if col ~= prevCol then
                colCount = 1
            else
                colCount = colCount + 1
            end
            prevCol = col
            -- print(col, colCount)
            
            if col ~= prevRows[j] then
                rowCounts[j] = 1
            else
                rowCounts[j] = rowCounts[j] + 1
		if rowCounts[j] >= 3 then
		    for k = 1, rowCounts[j] do
	               table.insert(vMatches, {j,i-k+1}) 
		    end
		end

            end
            prevRows[j] = col
            -- print(col, rowCounts[j])
        end

	for i, match in ipairs(vMatches) do
	    print(match[1], match[2])
	end
    end
end

function randomInt(start, length)
    return math.floor(math.random() * length + start)
end

return Grid
