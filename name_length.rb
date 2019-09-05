puts 'Enter first name.'
first = gets.chomp
puts 'Enter middle name.'
middle = gets.chomp
puts 'Enter last name.'
last = gets.chomp
length = first.length + middle.length + last.length
puts 'Did you know there are ' + length.to_s + ' letters in your name, ' + first + ' ' + middle + ' ' + last + '?'
