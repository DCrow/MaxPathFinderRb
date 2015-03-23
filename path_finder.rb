$i = 0
$num_lines = 0
#Считать из файла все символы
def read_file(file_name)
	file = File.open(file_name,"r")
	data = file.read
	file.close
	return data
end

#Разбить дату из файла на двумерный массив
def parse_data(file_name)
	data = read_file(file_name)
	str_arr = Array.new
	data.each_char do |str|
		if str != "\n"
			str_arr.push str
		else
			$num_lines += $num_lines			
		end
	end
	return str_arr
end


puts "Start Test 1"
string_to_out = parse_data("test_file.txt")
string_to_out.each do |str|
	print str
end
puts $num_lines
puts "End Test 1"

puts "Start Test 2"
data = read_file("test_file.txt")
puts data[1]
puts "End Test 2"