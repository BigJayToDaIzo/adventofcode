-- Using Luarock for md5 as I don't think the point of this exercise is to know how to code the
-- MD5 hashing function, rather how to use it in a loop to generate the hashcode that begins with
-- 5 consecutive 0s
local md5 = require("md5")

Key_prefix = "iwrupvqb"
Missing_key_chunk = 1
Key_sequence_discovered = false
--Iterate missink_key_chunk until we have a hash response that begins with 5 0s
while Key_sequence_discovered == false do
	--Try current iteration of key combination
	local attempt = Key_prefix .. Missing_key_chunk
	print("trying + " .. attempt .. " sequence...")
	local hash_back = md5.sumhexa(attempt)
	print("checking " .. hash_back .. "....")
	local s, e = string.find(hash_back, "000000")
	if s == 1 and e == 6 then
		Key_sequence_discovered = true
		print(attempt, "was our boi!")
	else
		Missing_key_chunk = Missing_key_chunk + 1
	end
end
