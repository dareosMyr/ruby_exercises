class Node
	attr_accessor :right, :left, :value
	def initialize(value)
		@value = value
		@right = nil
		@left = nil
	end
end

class Tree
	attr_reader :root
	def initialize
		@root = nil
	end

	def build_tree(array)
		@root = Node.new(array.shift)
		array.each do |i|
			node = @root
			node = traverse(node, i)
		end
	end

	def traverse(node, value)
		if node.right.nil? && value > node.value
			node.right = Node.new(value)
		elsif node.left.nil? && value <= node.value
			node.left = Node.new(value)
		elsif value > node.value
				traverse(node.right, value)
		elsif value <= node.value
				traverse(node.left, value)
		end
	end

	def breadth_first(value)
		queue = []
		node = @root
		queue<<node
		while !queue.empty?
			node = queue.shift
			puts node.value
			if node.value == value
				return node
			else
				queue<<node.left unless node.left == nil
				queue<<node.right unless node.right == nil
			end
		end		
	end

	def depth_first(value)
		stack = []
		node = @root
		stack<<node
		while !stack.empty?
			node = stack.pop
			if node.value == value
				return node
			else
				stack<<node.right unless node.right == nil
				stack<<node.left unless node.left == nil
			end
		end
	end

	def dfs_rec(node, value)
		return if node.nil?
		if node.value == value
			puts node
			exit
		end
		dfs_rec(node.left, value)
		dfs_rec(node.right, value)
	end
				
=begin
	def print_tree
		tmp = @root
		root_line = ' '*10 + "#{tmp.value}"
		spacer = ' / \\'
		first_line = ''
		puts root_line
		while tmp.right != nil && tmp.left != nil
			if tmp.left
				first_line<<"#{tmp.left.value}"
			end
			if tmp.right
				first_line<<"   #{tmp.right.value}"
			end
			tmp = tmp.left
		end
		puts spacer
		puts first_line
	end
=end

end


test = Tree.new
test.build_tree([25, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
#test.dfs_rec(test.root, 23)
puts test.breadth_first(23)