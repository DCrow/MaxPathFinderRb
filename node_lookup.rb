require_relative "path_finder.rb"

class Node
	def new(data_array, n, start_node)
		@data_hash = Hash.new { |hash, key| hash[key] = data_array[key] }
		@num_cools = n
		@nodeSum = data_array[start_node]
		if n == start_node
			(1..data_array.length/n).each do |i|
				data_hash.delete(i * n)
			end
		end
	end

	public
	@data_hash
	@num_cools = 0
	@nodeSum = 0
	@@maxNodeSum = 0
	@curr_node = 0
	@@nodeMaxPath = []
	@nodePath = []
	@nodeStack = []
	@wentBack = false

	def check_forward(n)
		if data_hash.has_key?(@curr_node + n)
			return true
		else
			return false
		end
	end

	def go_forward(n)
		@nodeStack.push curr_node
		@curr_node += n
		@nodeSum += data_hash[curr_node]
		@nodePath.push curr_node
		@wentBack = false
	end 

	def go_back()
		back_node = @nodeStack.pop
		@nodeSum -= data_hash[curr_node]
		@nodePath.pop curr_node
		@curr_node = back_node
		@wentBack = true
	end

	def checkMaxSum()
		maxSum = [@nodeSum,@maxNodeSum].max
		if @maxNodeSum != maxSum
			@@nodeMaxPath = @nodePath
			@maxNodeSum = maxSum
		end
	end

	def findMaxSumPath()
		left = @num_cools
		right = @num_cools + 1
		begin
			if check_forward(left) && @wentBack == false
				go_forward(left)
			elsif check_forward(right)
				go_forward(right)
			else
				checkMaxSum()
				go_back()
		end while !nodeStack.empty?
end