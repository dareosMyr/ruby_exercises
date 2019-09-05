puts 'HI SONNY! COME GIVE ME A KISS!'
input = ''
while input != 'BYE'
    if input == input.upcase
        randYear = 1930 + rand(21)
        puts 'NO, NOT SINCE ' + randYear.to_s + '!'
        input = gets.chomp
    else
        puts 'HUH!? SPEAK UP, SONNY!'
        input = gets.chomp
    end
end
puts 'YOU NEVER VISIT!'