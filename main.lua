local Grid = require("grid")

spawnTable = {
    [1] = 20,
    [2] = 20,
    [3] = 20,
    [4] = 20,
    [5] = 20
}

newGrid = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0}
}

grid = Grid:new(newGrid, spawnTable)
grid:fill()
grid:show()
hMatches, vMatches = grid:checkMatch()
print("Horizontal Matches")
for i, match in ipairs(hMatches) do
    print(match[1], match[2])
end

print("Vertical Matches")
for i, match in ipairs(vMatches) do
    print(match[1], match[2])
end

print(grid.spawnRateCount)