io.input("input.txt")

Input = io.read("*all")
Floor = 0 --Santa comes in on ground floor for some reason
SteppedInBasement = false
InstructionCausingBasement = 0
for i = 1, #Input do
	if Input:sub(i, i) == "(" then
		Floor = Floor + 1
	else
		Floor = Floor - 1
	end
	if Floor < 0 and SteppedInBasement == false then
		InstructionCausingBasement = i
		SteppedInBasement = true
	end
end
print(Floor)
print(InstructionCausingBasement)
