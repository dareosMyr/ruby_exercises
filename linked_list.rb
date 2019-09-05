class Node
	attr_accessor :next, :data
	def initialize(data)
		@data = data
		@next = nil
	end
end

class List
	def initialize
		@head = nil
		@tail = nil
		@count = 0
	end

	def iterate(pos)
		i = 1
		tmp = @head
		while i < pos
			tmp = tmp.next
			i += 1
		end
		return [tmp, i]
	end

	def empty_check
		if @head.nil?
			puts "List is empty"
			exit
		end
	end

	def prepend(data)
		if @head.nil?
			@head = @tail = Node.new(data)
			@count += 1
		else
			tmp = @head
			@head = Node.new(data)
			@head.next = tmp
			@count += 1
		end
	end

	def append(data)
		if @tail.nil?
			@tail = @head = Node.new(data)
			@count += 1
		else
			@tail.next = @tail = Node.new(data)
			@count += 1
		end
	end

	def rtn_head
		self.empty_check
		puts @head.data
	end

	def rtn_tail
		self.empty_check
		puts @tail.data
	end

	def size
		self.empty_check
		puts @count
	end

	def at(index)
		puts self.iterate(index)[0].data
	end

	def pop
		puts self.iterate(@count)[0].data
		self.iterate(@count)[0].data = nil
		@count -= 1
		self.iterate(@count)[0].next = nil
		@tail = self.iterate(@count)[0]
	end

	def contains?(value)
		if self.find(value) != nil
			return true
		else
			return false
		end
	end

	def find(value)
		for i in 1..@count
			if self.iterate(i)[0].data == value
				return self.iterate(i)[1]
			else
				i += 1
			end
		end
		return nil
	end

	def to_s
		i = 1
		str = ''
		while i <= @count
				str<<"( #{self.iterate(i)[0].data} ) -> "
				i += 1
		end
		str<<'nil'
		return puts str
	end
end

test = List.new
test.prepend('five')
test.prepend('four')
test.prepend('three')
test.prepend('two')
test.prepend('one')
test.append('six')
test.pop
test.append(7)
test.append([2,3])
test.prepend(5476)
test.pop
test.to_s