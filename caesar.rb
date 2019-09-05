def mod(n, m)
	if n < 97
		((n - 65)% m) + 65
	else
		((n - 97) % m) + 97
	end
end

def caesar()
	puts "Input sentence to be encrypted."
	string = gets.chomp
	puts "Input shift value."
	shift = gets.chomp
	processed_array = []
	processed_chr = ""
	array = string.split("")
	array.each do |letter|
		if letter.ord >= 65 && letter.ord <= 90 || letter.ord >= 97 && letter.ord <= 122
			processed_chr = (mod(letter.ord + shift.to_i, 26)).chr
		else
			processed_chr = letter
		end
		processed_array.push(processed_chr)
	end
	puts "Here is your encrypted sentence:"
	puts processed_array.join()
end

caesar()