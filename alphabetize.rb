words = []
words_alpha = []
input = 'test'
while input != ''
    input = gets.chomp
    words.push input
end
words.pop
puts words.sort
    