-- 20130202 Librarified: https://github.com/rjp/shakespeare
require 'shakeswrds'

function split(string, inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( string, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( string, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( string, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( string, theStart ) )
  return outResults
end

c1 = split(c1s, " ")
c2 = split(c2s, " ")
c3 = split(c3s, " ")

math.randomseed(os.time() * os.clock())
w1 = 1+(math.random(100*#c1) % #c1)
w2 = 1+(math.random(100*#c2) % #c2)
w3 = 1+(math.random(100*#c3) % #c3)

a = "Thou " .. c1[w1] .. " " .. c2[w2] .. " " .. c3[w3] .. "!"
print(a)
