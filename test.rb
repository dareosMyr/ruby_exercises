def test number
    if number.to_i < 10 
        puts number + ' is a dumb number'
    else puts 'I like that number'
    end
end

def arrays
	array1 = [1,2,3,4]
	answer = []
	array2 = [
		[1,2,3], 
		[4,5,6], 
		[7,8,9], 
		[1,4,7], 
		[2,5,8],
		[3,6,9],
		[1,5,9],
		[3,5,7]
	]
	
	array2.each {|i| answer << (i - array1).empty?}
	puts answer
	puts answer.any? {|i| i == true}
end

arrays