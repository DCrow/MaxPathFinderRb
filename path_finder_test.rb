require_relative "path_finder.rb"
require_relative "method_tester.rb"

test_start(1)
#string_to_out = parse_data("test_file.txt")
string_to_out = read_file("test_file.txt")

string_to_out.each do |str|
	print str
end
puts $num_lines
test_end(1)



test_start(2)
data = read_file("test_file2.txt")
data_i = 0
data_a = Array.new
sp_a = ""
col_num = 0
data.each.with_index do |line, index|
		# while !line.eql?(" ")
		# 	sp_a += line[index].to_s
		# 	index += 1
		# end
		#puts "Line length: #{line.length}"
	line.each_char do |c|
		col_num += 1
		if c != " " && c != "\n" && c != "\t"
			sp_a += c
			puts c
		elsif sp_a == " "
			puts "Nothing to Push"
		else
			data_a.push sp_a.to_i
			puts "Pushed"
			sp_a = " "
		end
		#puts "Column number: #{col_num}"
		if col_num == line.length && sp_a != " "
			data_a.push sp_a.to_i
			puts "Pushed last"
		end
		
	end
	col_num = 0
		# sp_a.to_i
		# data_a.push data_i
		# data_i += c.to_i
end
#puts data_i
#puts "w"
puts "!" + " " + "#{data_a}"
test_end(2)



test_start(3)
data = read_file("test_file.txt")
data_s = ""
data.each.with_index do |d, index|
	data_s += d.to_s
	if index == 1
		print "!" + d + "!"
	end
end
data_s.split(" ")
data_s.each_char.with_index do |str, index|
	print str
	if index == 0
		print "!" + str + "!"
	end
end
test_end(3)

test_start(4)
puts parse_data(read_file("test_file2.txt"))
test_end(4)

test_start(5)
puts numOfLines(read_file("test_file2.txt"))
puts numOfCollumns(read_file("test_file2.txt"))
test_end(5)