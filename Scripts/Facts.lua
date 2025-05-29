function Initialize()

   CURRENTPATH = SKIN:GetVariable('CURRENTPATH')
   Facts = {}
   Authors = {}
   i = 0

   for line in io.lines(CURRENTPATH..'ListOfFacts.txt') do
      if string.sub(line, 1, 7) == '<quote>' then
         i = i + 1
         Facts[i] = string.sub(line, 8)
      elseif string.sub(line, 1, 8) == '<author>' then
         Authors[i] = string.sub(line, 9)
      else
         Facts[i] = Facts[i]..'#CRLF#'..line
      end
   end
   
end -->Initialize

function Update()

   rand = math.random(1, #Facts)
   SKIN:Bang('!SetOption', 'MeterQuote', 'Text', Facts[rand])
   SKIN:Bang('!SetOption', 'MeterAuthor', 'Text', Authors[rand])
   
   return 'Quote number: '..rand
   
end -->Update