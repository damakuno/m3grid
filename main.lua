local Grid = require("grid")

newGrid = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0}
}

grid = Grid:new(newGrid)
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
grid:swap(1, 1)
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
