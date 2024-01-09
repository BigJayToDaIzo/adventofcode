--Day2Y2015 Advent of Code
-- Function to calcualte cubed feet PLUS area of smallest side
function CalcPaperNeeded(l, w, h)
  -- Calculate smallest side area, calculate total area and add
  local smallestSideArea = math.min(l*w, w*h, h*l)
  local area = 2*l*w + 2*w*h + 2*h*l
  return area + smallestSideArea
end

function CalculateRibbon(l, w, h)
  local as = {l, w, h}
  table.sort(as)
  --        peremiter      +  ribbon
  return 2*as[1] + 2*as[2] + l * w * h
end

-- Each line contains a package dimension set
Paper = 0
Ribbon = 0
for line in io.lines('input.txt') do
  _, _, L, W, H = string.find(line, "(%d*)x(%d*)x(%d*)")
  local lasnum = tonumber(L)
  local wasnum = tonumber(W)
  local hasnum = tonumber(H)
  Paper = Paper + CalcPaperNeeded(lasnum, wasnum, hasnum)
  Ribbon = Ribbon + CalculateRibbon(lasnum, wasnum, hasnum)
end

print(Paper)
print(Ribbon)
