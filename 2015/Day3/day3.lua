-- Santa is starting at the origin and we're traversing nodes and keeping track of visits.
Santa = {
	x = 0,
	y = 0,
}
RoboSanta = {
	x = 0,
	y = 0,
}

NodesVisited = { { x = 0, y = 0, timesVisited = 1 } }
-- Santa moves from origin in direction of first input
io.input("input.txt")
Input = io.read("*all")
-- Iterate through single characters in a long string
-- Get first character back from string
for i = 1, #Input do
	-- Switch between >,v,<,^ move to the node, iterate visited
	local move = Input:sub(i, i)
	local deliverer
	if i % 2 ~= 0 then
		deliverer = Santa
	else
		deliverer = RoboSanta
	end
	if move == ">" then
		deliverer.x = deliverer.x + 1
	elseif move == "v" then
		deliverer.y = deliverer.y - 1
	elseif move == "<" then
		deliverer.x = deliverer.x - 1
	else
		deliverer.y = deliverer.y + 1
	end
	-- Check Santa.nodesVisited and either add or update node
	local newNode = true
	local n = NodesVisited
	for _, coord in ipairs(n) do
		if deliverer.x == coord.x and deliverer.y == coord.y then
			coord.timesVisited = coord.timesVisited + 1
			newNode = false
			break
		end
	end
	if newNode then
		table.insert(NodesVisited, { x = deliverer.x, y = deliverer.y, timesVisited = 1 })
	end
end

-- How many houses receive at least one present?
print(#NodesVisited)
