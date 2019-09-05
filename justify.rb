lineWidth = 40
array = ['Table of Continents', 'Chapter 1:  Numbers', 'Page 69', 'Chapter 2:  Letters', 'Page 420', 'Chapter 3:  Symbols', 'Page 666']
puts array[0].center lineWidth
puts ''
puts array[1].ljust(lineWidth/2) + array[2].rjust(lineWidth/2)
puts array[3].ljust(lineWidth/2) + array[4].rjust(lineWidth/2)
puts array[5].ljust(lineWidth/2) + array[6].rjust(lineWidth/2)