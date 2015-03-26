require_relative "node_lookup.rb"
require_relative "method_tester.rb"
require_relative "path_finder.rb"

# Load data
data_ar = parse_data_array(read_file("test_file4.txt"))
data_ar_m = parse_data(read_file("test_file2.txt"))
#show_value(data_ar,"test_file2")
puts data_ar
colls = numOfCollumns(read_file("test_file4.txt"))
show_value(colls, "Collumns")


test_start(1)

	node1 = Node.new(data_ar, colls, 0)
	puts node1.getDataHash()
	if node1.getDataHash().has_key?(15)
		puts "Yes"
	else
		puts "no"
	end
	#show_value_bool(node1.check_forward(5),"check_forward")
	#show_value_bool(node1.getWentBack(),"went back")
	#show_value_bool((node1.getWentBack() == false),"getWentBack")
	#show_value_bool(false == false,"0")
	#show_value((node1.check_forward(5) && (node1.getWentBack() != true)),"eq")
	node1.findMaxSumPath()
	#puts Node.maxNodeSum
test_end(1)