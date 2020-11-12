local Grid = {}

function Grid:new(grid, object)
    object = object or { 
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

function Grid:update(dt) end

function Grid:draw() end

function Grid:checkMatch()
    local grid = self.grid
    local prevCol = 0
    local colCount = 0
    for i, row in ipairs(grid) do
	print("\n")
        for j, col in ipairs(row) do
	    if col ~= prevCol then
		   colCount = 1
	    else
		    colCount = colCount + 1
        end
	prevCol = col
	print(col, colCount)
	end
    end
end

function randomInt(start, length)
    return math.floor(math.random() * length + start)
end

return Grid
