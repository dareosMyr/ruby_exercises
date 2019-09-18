class Squares
	attr_reader :parent
	attr_accessor :position, :child
	def initialize(position, parent=nil)
		@position = position
		@child = []
		@parent = parent
	end
end

def find_moves(origin, goal)
	if origin[0] <= 7 && origin[0] >= 0 && origin[1] <= 7 && origin[1] >= 0 && goal[0] <= 7 && goal[0] >= 0 && goal[1] <= 7 && goal[1] >= 0
		start = Squares.new(origin)
		finish = Squares.new(goal)
		build_path(search_moves(build_tree(start), finish))
	else
		return puts "Squares must be on the board! x & y = (0..7)"
	end
end

def build_tree(root)
	avail_moves(root).each do |i|
		root.child << i
	end
	root
end

def avail_moves(square)
 legal_moves = [
		[2, 1],
		[1, 2],
		[-1, 2],
		[-1, -2],
		[1, -2],
		[2, -1],
		[-2, -1],
		[-2, 1]
	]

	moves = legal_moves.collect do |pos|
		square.position.collect.with_index { |v,i| v + pos[i]}
	end
	moves.select! { |pos| pos[0] <= 7 && pos[1] >= 0 && pos[0] >= 0 && pos[1] <= 7 }
	possible = moves.map do |i|
		Squares.new(i, square)
	end
	possible
end

def search_moves(start, finish)
	queue = []
	start.child.each do |i|
		queue << i
	end
	while !queue.empty?
		node = queue.shift
		if node.position == finish.position
			break node
		else
			build_tree(node).child.each do |i|
				queue << i
			end 
		end
	end
end

def build_path(square)
	node = square
	counter = 0
	path = []
	path << node
	while node.parent != nil
		node = node.parent
		path << node
		counter += 1
	end
	display_result(path, counter)
end

def display_result(path, counter)
	puts "Your valient knight made it in #{counter} moves!"
	puts "Here is his path:"
	path.reverse!.each do |i|
		print i.position
		print "\n"
	end
end

find_moves([4,4], [0,0])