module Enumerable
	def my_each
		i = 0
		array = []
		while i < self.length
			array << yield(self[i])
			i += 1
		end
		array
	end

	def my_each_with_index
		i = 0
		while i < self.length
			yield(self[i], i)
			i += 1
		end
	end

	def my_select
		array = []
		self.my_each do |i|
			array << i if yield i
		end
		array
	end

	def my_all?
		false_count = 0
		self.my_each do |i|
			if yield(i) == false
				false_count += 1
			end
		end
		return false if false_count > 0
		return true if false_count == 0
	end

	def my_any?
		true_count = 0
		self.my_each do |i|
			if yield(i) == true
				true_count += 1
			end
		end
		return true if true_count > 0
		return false if true_count == 0
	end

	def my_none?
		true_count = 0
		self.my_each do |i|
			if yield(i) == true
				true_count += 1
			end
		end
		return true if true_count == 0
		return false if true_count > 0
	end

	def my_count
		counter = 0
		self.my_each do |i|
			if yield(i) == true
				counter += 1
			end
		end
		return counter
	end

	def my_map(&proc)
		array = []
		self.my_each do |i|
			array << proc.call(i)
		end
		array
	end

	def my_inject(int=0)
		total = int
		self.my_each do |i|
			total = yield(total, i)
		end
		return total
	end
end

def multiply_els(numbers)
	numbers.my_inject(1) { | total, i| total * i }
end

#a_proc = Proc.new { |i| i*2 }

#puts [1,2,3,4,5].my_each { |i| }
#hash = {one: 1, two: 2, three: 3}
#puts hash.each { |k,v| puts v }
#puts ["1","2","3","Cat","5"].my_each_with_index { |num, index| puts "#{num}, #{index}" }
#puts [1,2,3,4,5].my_select { |i| i == 4 }
#puts [1,2,3,4,5].select { |i| i > 4 }
#puts [2,3,4,5,6,7,8,9].my_all? { |i| i > 0}
#puts ['2','3','4','5','6','7','8','9'].my_any? { |i| i.is_a? Integer}
#puts [2,3,4,5,6,7,8,9].my_none? { |i| i > 10}
#puts [2,3,4,5,6,7,8,9].my_count { |i| i%2==0}
puts [2,3,4,5,6,7,8,9].my_map() {|i| i*3}
#puts [2,3,4,5,6,7,8,9].my_inject(1) { |total, i| total / i}
#puts multiply_els([2,4,5])