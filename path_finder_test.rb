require_relative "path_finder.rb"
require_relative "method_tester.rb"

data1 = read_file("test_file2.txt")

test_start(1)
#string_to_out = parse_data("test_file.txt")
string_to_out = read_file("test_file.txt")

string_to_out.each do |str|
	print str
end
test_end(1)



test_start(2)
data = read_file("test_file2.txt")
data_i = 0
data_a = Array.new
sub_data_a = Array.new
sp_a = ""
col_num = 0
data.each.with_index do |line, index|
		# while !line.eql?(" ")
		# 	sp_a += line[index].to_s
		# 	index += 1
		# end
		#puts "Line length: #{line.length}"
		sub_data_a = []
	line.each_char do |c|
		col_num += 1
		if c != " " && c != "\n" && c != "\t"
			sp_a += c
			puts c
		elsif sp_a == " "
			puts "Nothing to Push"
		else
			sub_data_a.push sp_a.to_i
			puts "Pushed"
			sp_a = " "
		end
		#puts "Column number: #{col_num}"
		if col_num == line.length && sp_a != " "
			sub_data_a.push sp_a.to_i
			puts "Pushed last"
		end
		
	end
	data_a.push sub_data_a
	puts "Pushed sub_data_a"
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

	array4 = parse_data_array(read_file("test_file2.txt"))
		puts array4[1]
		puts array4[2]
		puts array4.length
		puts array4
test_end(4)

test_start(5)
	puts numOfLines(read_file("test_file2.txt"))
	puts numOfCollumns(read_file("test_file2.txt"))
test_end(5)

 test_start(6)
 	array6 = parse_data(data1)
 	num_lines = array6.length
 	num_coll = array6[1].length
 	show_value(num_coll,"Num of coll")
 	maxSum = 0
 	maxEl = 0
 	pathNum = 0
 	#(0..2**(array6.length)-1).each  do |el|
 		(0..num_lines - 1).each do |n|
 			show_value(n, "n")
 			(0..num_coll - 1).each do |i|
 				show_value(i, "i")
 				if i + 1 != num_coll
 					maxEl = [array6[n][i], maxEl].max
 					show_value(maxEl,"Max Element now")
 				end
 			end
 			
 			maxEl = 0
 		end
 	#end

 test_end(6)

