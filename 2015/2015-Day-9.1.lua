local cities = {} -- distances

for line in io.lines("input") do
	city1, city2, dist = line:match("(%w+) to (%w+) = (%d+)")
	if not cities[city1] then
		cities[city1] = {}
	end
	cities[city1][city2] = tonumber(dist)
	if not cities[city2] then
		cities[city2] = {}
	end
	cities[city2][city1] = tonumber(dist)
end

local minDistance = math.huge
local maxDistance = 0
local curDistance = 0

function CheckCoverDistances(city)
	local allVisited = true
	for _, city in pairs(cities) do
		if _ ~= "visited" then
			if not city.visited then
				allVisited = false
				break
			end
		end
	end
	if allVisited then
		if minDistance >= curDistance then
			minDistance = curDistance
		end
		if maxDistance <= curDistance then
			maxDistance = curDistance
		end
		return
	end

	for name, dist in pairs(cities[city]) do
		if name ~= "visited" then
			if not cities[name].visited then
				cities[name].visited = true
				curDistance = curDistance + dist
				CheckCoverDistances(name)
				cities[name].visited = false
				curDistance = curDistance - dist
			end
		end
	end
end

--DFS
for name, tab in pairs(cities) do
	tab.visited = true
	CheckCoverDistances(name)
	tab.visited = false
end

print("Part 1: " .. minDistance)
print("Part 2: " .. maxDistance)