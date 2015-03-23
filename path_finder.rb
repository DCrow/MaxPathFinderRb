#Считать из файла все символы
def read_file(file_name)
	file = File.open(file_name,"r")
	data = file.read
	file.close
	return data
end

#Разбить дату из файла на двумерный массив
def parse_data()