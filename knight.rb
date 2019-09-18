class Node
	attr_accessor :children, :position
	def initialize(position)
		@position = position
		@children = []
	end
end

class Tree
	attr_accessor :root
	def initialize(position)
		@root = Node.new(position)
	end

	def append(node, position)
		if @root.children.empty?
			@root.children << Node.new(position)
		else
			node.children.each do |i|
				i.children << Node.new(position)
			end
		end
	end

	def traverse(node, position)
		if @root.children.empty?
			@root.children << Node.new(position)
		else
			node.children.each do |i|
				if i.children.empty?
					i.children << Node.new(position)
				else
					traverse(i, position)
				end
			end
		end
	end
end

class Piece
	attr_reader :legal_moves, :name
	attr_accessor :position, :avail_moves
	def initialize(name='K', position)
		@name = name
		@position = position
		@avail_moves = Tree.new(position)
		@legal_moves = [
			[2, 1],
			[1, 2],
			[-1, 2],
			[-1, -2],
			[1, -2],
			[2, -1],
			[-2, -1],
			[-2, 1]
		]
	end
end

class Game
	attr_reader :board
	def initialize
		@board = mk_board
	end

	def mk_board
		board = Array.new(8) { Array.new(8, ' ') }
		board
	end

	def display_board
		i = 0
		8.times do
			print "#{@board[i]}"
			print "\n"
			print "\n"
			i += 1
		end
	end

	def knight_moves(position, goal)
		knight = Piece.new(position)
		@board[knight.position[0]][knight.position[1]] = knight.name
		possible_moves(knight.position, knight)
		knight
	end

	def possible_moves(position, piece)
		piece.legal_moves.each_with_index do |i, x|
			result = []
			position.each_with_index do |v, k|
				result << piece.legal_moves[x][k] + v
			end
			if result.all?(&:positive?) == false || result[0] > 7 || result[1] > 7
				return
			else
				piece.avail_moves.append(piece.avail_moves.root, result)
			end
		end
		piece.avail_moves.root.children.each do |i|
			possible_moves(i, piece)
		end
	end
end

test = Game.new
puts test.knight_moves([0,0], [1,2])