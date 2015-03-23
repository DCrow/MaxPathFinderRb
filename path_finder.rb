#Считать из файла все числа, также узнает сколько строк в файле
def read_file(file_name)
	data = Array.new
	file = File.open(file_name,"r").readlines.each do |line|
		data.push line
	end
	return data
end

#На выходе получаем массив со всеми числами из файла
def parse_data(data)
	data_array = Array.new
	num_str = " "
	col_num = 0
	data.each.with_index do |line, index|
		line.each_char do |c|
			col_num += 1

			if c != " " && c != "\n"
				num_str += c
			elsif num_str != " "
				data_array.push num_str.to_i
				num_str = " "
			end

			if col_num == line.length && num_str != " "
			data_array.push num_str.to_i
			end
		end
		col_num = 0
	end
	return data_array
end

#Определяет количество линий N в файле
def numOfLines(data)
	return data.length
end

def numOfCollumns(data)
	return parse_data(data).length/data.length
end

