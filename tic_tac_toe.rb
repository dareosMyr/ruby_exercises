class Game
	def initialize
		@game_board = {}
		@game_key = {}
		puts "Lets play Tic-Tac-Toe!"
		puts "Getting set up..."

		for k in 1..9 do
			@game_board[k] = ' '
		end

		for k in 1..9 do
			@game_key[k] = k
		end

		puts "Ready!"
		display_board(@game_key)
		puts "This is your reference board, use it when deciding where to place your X's and O's"
		puts "To play, enter the number of the square you want your piece to occupy."
		puts "Player 1 is X's, Player two is O's."
		puts "Press Enter when ready."
		gets.chomp
		round
	end

	def display_board(board, key=@game_key)
		for k in 1..9 do
			print "[#{board[k]}]"
			if k == 3 || k == 6 || k == 9
				print "\n"
			end
		end
	end
	
	def round
		while victory? == false
			puts "Player 1's move >>"
			parse_input(piece_x)
			break if victory? != false
			puts "Player 2's move >>"
			parse_input(piece_o)
		end
		victory_message
	end

	def parse_input(piece, input=gets.chomp)
		puts "Please input a number from 1-9" unless input == /^[0-9]$/
		if @game_board[input.to_i] == " "
			@game_board[input.to_i] = piece
		elsif @game_board[input.to_i] != " "
			puts "That board position is taken"
		end	
		display_board(@game_board)
	end

	def victory? 
		x_positions = []
		o_positions = []
		@x_wins = []
		@o_wins = []
		win_conditions = [
			[1,2,3], 
			[4,5,6], 
			[7,8,9], 
			[1,4,7], 
			[2,5,8],
			[3,6,9],
			[1,5,9],
			[3,5,7]
		]
		@game_board.each do |k, v|
			x_positions << k if v == "X"
		end

		@game_board.each do |k, v|
			o_positions << k if v == "O"
		end

		win_conditions.each {|i| @x_wins << (i - x_positions).empty?}
		win_conditions.each {|i| @o_wins << (i - o_positions).empty?}
		return @x_wins.any? {|i| i == true} || @o_wins.any? {|i| i == true}
	end

	def victory_message
		if @x_wins.any? {|i| i == true}
			puts "Player 1 Wins!"
		elsif @o_wins.any? {|i| i == true}
			puts "Player 2 Wins!"
		end
	end

	def piece_x
		piece = "X"
		return piece
	end

	def piece_o
		piece = "O"
		return piece
	end
end

game1 = Game.new