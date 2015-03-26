require_relative "path_finder.rb"
class Node

	# Конструктор. Принимает массив данных. Количество столбцов в таблице данных
	# из которой сделан массив. И начальную вершину первой строки.
	def initialize(data_array, num_cools, start_node)
		@data_hash = Hash[makeNumberArray(data_array.length - 1).zip(data_array)]
		@num_cools = num_cools
		@nodeSum = data_array[start_node]
		@curr_node = start_node
		if num_cools == start_node
			(1..(data_array.length)/num_cools).each do |i|
				@data_hash.delete(i * num_cools)
			end
		end
	end

	public
	@data_hash # Для хранения значений
	@num_cools = 0 # Хранение значений столбцов в таблице
	@nodeSum = 0 # Сумма вершин предшествующих нынешней с учетом нынешней
	@@maxNodeSum = 0 # Максимальная сумма вершин. Для удобства одна на все древа.
	@curr_node = 0 # Вершина в которой мы находимся
	@@nodeMaxPath = Array.new # Путь максимальной суммы вершин @@maxNodeSum. Для удобства одна на все древа.
 	@nodePath = Array.new # Путь который мы использовали чтобы попасть в @curr_node
	@nodeStack = Array.new # Вершины от которых мы еще не посетили второй соседней вершины
	@wentBack = false # Для знания вернулись ли в вершину из которой не посетили второго соседа или нет.

	# Проверить есть ли соседняя вершина
	def check_forward(n)
		if @data_hash.has_key?(@curr_node + n)
			return true
		else
			return false
		end
	end

	# Перейти в соседнюю вершину
	def go_forward(n)
		@nodeStack.push @curr_node
		@curr_node += n
		@nodeSum += data_array[curr_node]
		@nodePath.push @curr_node
		@wentBack = false
	end 

 	# Вернуться в вершину от которой мы не посещали вторую соседнюю вершину
	def go_back()
		if nodeStack.empty?
			@wentBack = true
		else
			@wentBack = false
			return
		end
		back_node = @nodeStack.pop
		@nodeSum -= data_array[curr_node]
		@nodePath.pop @curr_node
		@curr_node = back_node
	end

	# Проверить не является ли сумма на ныншнем пути наибольшей
	def checkMaxSum()
		maxSum = [@nodeSum,@maxNodeSum].max
		if @maxNodeSum != maxSum
			@@nodeMaxPath = @nodePath
			@maxNodeSum = maxSum
		end
	end

	# Поиск пути наибольшей суммы
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
			end
		end while !@nodeStack.empty? && @wentBack == false
	end

	#For TESTING PURPOSES
	def showDataArray()
		return @data_hash
	end

	def makeNumberArray(n)
		num_arr = Array.new
		(0..n).each do |k|
			num_arr[k] = k
		end
		return num_arr
	end

end