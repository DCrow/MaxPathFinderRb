require_relative "path_finder.rb"
require_relative "method_tester.rb"
class Node

	# Конструктор. Принимает массив данных. Количество столбцов в таблице данных
	# из которой сделан массив. И начальную вершину первой строки.
	def initialize(data_array, num_cools, start_node)
		@data_hash = Hash[makeNumberArray(data_array.length - 1).zip(data_array)]
		@num_cools = num_cools
		@nodeSum = data_array[start_node]
		@curr_node = start_node
		@start_node = start_node
		@nodeStack = Array.new
		@nodePath = Array.new
		@nodePath.push start_node
		@wentBack = false
		if num_cools == start_node
			(1..(data_array.length)/num_cools).each do |i|
				@data_hash.delete(i * num_cools)
			end
		end
	end

	public
	@start_node
	@data_hash # Для хранения значений
	@num_cools = 0 # Хранение значений столбцов в таблице
	@nodeSum = 0 # Сумма вершин предшествующих нынешней с учетом нынешней
	@@maxNodeSum = 0 # Максимальная сумма вершин. Для удобства одна на все древа.
	@curr_node = 0 # Вершина в которой мы находимся
	@@nodeMaxPath = Array.new # Путь максимальной суммы вершин @@maxNodeSum. Для удобства одна на все древа.
 	@nodePath = Array.new # Путь который мы использовали чтобы попасть в @curr_node
	@nodeStack = Array.new # Вершины от которых мы еще не посетили второй соседней вершины
	@wentBack = false # Для знания вернулись ли в вершину из которой не посетили второго соседа или нет.
	@pathEnd = false
	# Проверить есть ли соседняя вершина
	def check_forward(n)
		c = @curr_node + n
			if @data_hash.has_key?(c) && (n - @start_node - 2 != 0)
				show_value(c,"Key")
				return true
			else
				show_value(c,"key")
				return false
			end
	end

	# Перейти в соседнюю вершину
	def go_left()
		show_value(@curr_node,"curr_node")
		if check_forward(@num_cools + 1)
			@nodeStack.push @curr_node
		end
		go(@num_cools)
	end

	def go(n)
		@curr_node += n
		@nodeSum += @data_hash[@curr_node]
		@nodePath.push @curr_node
		@wentBack = false
	end

	def go_right()
		show_value(@curr_node,"curr_node")
		go(@num_cools + 1)
	end 

 	# Вернуться в вершину от которой мы не посещали вторую соседнюю вершину
	def go_back()
		# if @nodeStack.empty? #ТУТ ПРОБЛЕМА. НАДО ИСПРАВИТЬ.
		# 	@wentBack = true
		# else
		# 	@wentBack = false
		# 	return
		# end
		

		
		show_value(@nodePath, "Current Node Path s")
		show_value(@nodeSum, "Current Node Sum s")
		show_value(@nodeStack,"Current Node Stack s")
		show_value(@curr_node, "Current Node s")
		if !@nodeStack.empty?

			# if (@num_cools - 1 - @start_node == 0)
			# 	(0..@nodeStack.length).each do |x|
			# 		@nodeStack.pop
			# 	end
			# 	print_mess("Cannot go Back")
			# 	return
			# end
			@wentBack = true
			back_node = @nodeStack.pop
			

			
			i_r = (@curr_node - back_node - 1)/@num_cools - 1
			show_value(i_r, "i_r")
			i_l = (@curr_node - back_node)/@num_cools - 1
			show_value(i_l,"i_l")

			if (i_r.is_a? Integer) && i_r != 0 && i_r > 0
				(0..i_r).each do |x|
					b_nod = @nodePath.pop
					show_value(@nodePath, "nodePath")
					show_value(b_nod, "b_nod")
					show_value(@data_hash[b_nod], "data_hash")
					@nodeSum -= @data_hash[b_nod]
					
				end
			elsif (i_l.is_a? Integer) && i_l != 0 && i_l > 0
				(0..i_l).each do |x|
					b_nod = @nodePath.pop
					show_value(@nodePath, "nodePath")
					show_value(b_nod, "b_nod")
					show_value(@data_hash[b_nod], "data_hash")
					@nodeSum -= @data_hash[b_nod]
					
				end
			else
				b_nod = @nodePath.pop
				@nodeSum -= @data_hash[@curr_node]
			end
			show_value(back_node,"Popped value")
			show_value(@nodePath, "Current Node Path")
			show_value(@nodeSum, "Current Node Sum")
			show_value(@nodeStack,"Current Node Stack")
			@curr_node = back_node
			show_value(@curr_node, "Current Node")
		else
			@pathEnd = true
		end
	end

	# Проверить не является ли сумма на ныншнем пути наибольшей
	def checkMaxSum()
		show_value(@@maxNodeSum,"maxNodeSum")
		show_value(@nodeSum,"nodeSum")
		maxSum = [@nodeSum,@@maxNodeSum].max
		show_value(maxSum, "maxSum")
		if maxSum == @nodeSum
			(0..@@nodeMaxPath.length).each do |i|
				@@nodeMaxPath.pop
			end
			(1..@nodePath.length).each do |i|
				@@nodeMaxPath.push @nodePath[i-1]
			end
			#@@nodeMaxPath = @nodePath
			@@maxNodeSum = maxSum
			show_value(@@nodeMaxPath,"nodeMaxPath f")
		end
	end

	# Поиск пути наибольшей суммы
	def findMaxSumPath()
		left = @num_cools
		right = @num_cools + 1
		begin
			#show_value_bool(@wentBack, "wentBack")
			if (check_forward(left) && (@wentBack == false))
				print_mess("Went Forward Left")
				#show_value(@curr_node, "curr_node")
				go_left()
				
			elsif check_forward(right)
				print_mess("Went Forward Right")
				show_value(@curr_node, "curr_node")
				go_right()
				
			else
				checkMaxSum()
				print_mess("wentBack")
				go_back()
			end

		end while !@pathEnd
	end

	#For TESTING PURPOSES
	def getDataHash()
		return @data_hash
	end

	def getWentBack()
		return @wentBack
	end

	def getNodeSum()
		return @nodeSum
	end

	def getNodePath()
		return @nodePath
	end

	def getNodeStack()
		return @nodeStack
	end

	def getPathEnd()
		return @pathEnd
	end

	def getMaxSum()
		return @@maxNodeSum
	end

	def getMaxPath()
		return @@nodeMaxPath
	end

	def makeNumberArray(n)
		num_arr = Array.new
		(0..n).each do |k|
			num_arr[k] = k
		end
		return num_arr
	end

end
