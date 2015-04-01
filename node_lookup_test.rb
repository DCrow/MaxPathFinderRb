require_relative "node_lookup.rb"
require_relative "method_tester.rb"
require_relative "path_finder.rb"

# Load data
file1 = DataChanger.new("test_file3.txt")
data_ar = file1.parse_data_array()
#data_ar_m = parse_data(read_file("test_file2.txt"))
#show_value(data_ar,"test_file2")
puts data_ar
colls = file1.getNumOfCollumns()
show_value(colls, "Collumns")


test_start(1)

	#node1 = Node.new(data_ar, colls, 0)
	node2 = Node.new(data_ar, colls)
	# puts node2.getDataHash()
	# if node2.getDataHash().has_key?(15)
	# 	puts "Yes"
	# else
	# 	puts "no"
	# end
	#show_value_bool(node1.check_forward(5),"check_forward")
	#show_value_bool(node1.getWentBack(),"went back")
	#show_value_bool((node1.getWentBack() == false),"getWentBack")
	#show_value_bool(false == false,"0")
	#show_value((node1.check_forward(5) && (node1.getWentBack() != true)),"eq")
	#node1.findMaxSumPath()
	node2.find_max_sum_path()
	puts node2.get_node_max_path()
	puts node2.get_node_max_sum()
	#puts Node.maxNodeSum
	

	#node1.checkMaxSum()
	#puts node2.getMaxSum()
	#puts node2.getMaxPath()
	#puts node1.getNodeSum()
	#puts node1.getNodePath()


test_end(1)