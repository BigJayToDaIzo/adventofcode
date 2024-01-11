Lines = io.open("input.txt", "r")

--Globals
Vowels = { "a", "e", "i", "o", "u" }
Nonos = { "ab", "cd", "pq", "xy" }
Nice_words = 0

for line in Lines:lines() do
	local has_three_vowels = false
	local contains2xchar = false
	local containsNonos = false
	local vowelIter = 0
	for i = 1, #line do
		-- I need to take a strong look at this one, it was harder than it should have been to put together but I was trying to short circuit the more intense string manipulation where I could
		-- I know I can do better than this
		local sub = line:sub(i, i + 1)
		--I originally had this at the bottom of the chain as the more expensive op, but it was short circuting and causing my vowel counter to miss vowels on the far end of strings
		if string.sub(sub, 1, 1) == string.sub(sub, 2, 2) then
			contains2xchar = true
		end
		if vowelIter < 3 then
			for j = 1, #Vowels do
				if Vowels[j] == string.sub(line, i, i) then
					vowelIter = vowelIter + 1
				end
				if vowelIter >= 3 then
					has_three_vowels = true
					break
				end
			end
		end
		for j = 1, #Nonos do
			if sub == Nonos[j] then
				containsNonos = true
				break
			end
		end
		if containsNonos then
			break
		end
	end
	--Check whole line for 3x vowels (is this cheaper and should it be the short circuit?)
	if has_three_vowels and contains2xchar and not containsNonos then
		print("We found a nice word people!")
		Nice_words = Nice_words + 1
	end
end

print(Nice_words)
