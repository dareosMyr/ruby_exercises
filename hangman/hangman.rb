

def choose_word
	possible_words = []
	dictionary = File.readlines("5desk.txt", chomp: true)
	dictionary.each do |word|
		if word.length >= 5 && word.length <= 12
			possible_words.push(word)
		end
	end
	possible_words[rand(possible_words.length)]
end

def generate_goal(goal_word)
	goal_correct = []
	goal_array = goal_word.split('')
	goal_array.each do |letter|
		goal_correct.push("_")
	end
	goal_correct
end

def save_game(goal_word, genned_goal, remaining_guesses)
	save_data = [goal_word, genned_goal, remaining_guesses]
	File.open('saved_game.txt', 'w') do |save|
		save.puts save_data
	end
end

def load_game
	save_data = File.readlines 'saved_game.txt'
	puts save_data
end

def parse_guess(guess, goal_word, genned_goal, remaining_guesses)
	if goal_word.split('') - guess.split('') == []
		"win"
	elsif guess == "save"
		"save"
	elsif guess.length > 1 
		puts "You can only guess one letter at a time!"
	elsif guess.kind_of? Integer
		puts "What word has a number in it?"
	elsif goal_word.split('').any? { |letter| letter == guess}
		goal_word.split('').each_with_index do |letter, index|
			if guess == letter
				genned_goal[index] = letter.to_s
			end
		end
		genned_goal.join(' ')
	elsif !goal_word.split('').any? { |letter| letter == guess}
		false
	end
end

def game
	guessed = []
	remaining_guesses = 6
	puts "Let's play Hangman!"
	puts "Would you like to load a saved game? y/n"
	response = gets.chomp
	if response == "y"
		load_game
	end
	puts "I'm thinking of a word..."
	puts goal_word = choose_word
	puts "Got one! Take a guess!"
	genned_goal = generate_goal(goal_word)
	puts genned_goal.join(' ')
	guess = gets.chomp.downcase
	guessed.push(guess)
	parse_guess(guess, goal_word, genned_goal, remaining_guesses)
	while remaining_guesses > 0
		if parse_guess(guess, goal_word, genned_goal, remaining_guesses) == false
			puts "Nope! Try again! #{remaining_guesses} guesses left."
			puts genned_goal.join(' ')
			guess = gets.chomp.downcase
			guessed.push(guess)
			puts guessed.join(',')
			parse_guess(guess, goal_word, genned_goal, remaining_guesses)
			remaining_guesses -= 1
		elsif parse_guess(guess, goal_word, genned_goal, remaining_guesses) == "win"
			puts "Excellent guess! You got the word! It was #{goal_word}!"
			break
		elsif parse_guess(guess, goal_word, genned_goal, remaining_guesses) == "save"
			save_game(goal_word, genned_goal, remaining_guesses)
			puts "Game saved!"
			break
		elsif goal_word == genned_goal.join('')
			puts "You got all the letters! Good job! The word was #{goal_word}."
			break
		else
			puts "Good Guess!"
			puts genned_goal.join(' ')
			guess = gets.chomp.downcase
			guessed.push(guess)
			puts guessed.join(',')
			parse_guess(guess, goal_word, genned_goal, remaining_guesses)
		end
	end
end

game