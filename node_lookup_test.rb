require_relative "node_lookup.rb"
require_relative "method_tester.rb"
require_relative "path_finder.rb"

# Load data
data_ar = parse_data_array(read_file("test_file3.txt"))
data_ar_m = parse_data(read_file("test_file2.txt"))
#show_value(data_ar,"test_file2")
puts data_ar
colls = numOfCollumns(read_file("test_file3.txt"))
show_value(colls, "Collumns")

def testF(node1, colls)
	left = colls
	right = colls + 1
	i = 0
	begin
		print_mess("Try #{i}")
		if (node1.check_forward(left) && (node1.getWentBack() == false))
					print_mess("Went Forward Left")
					#show_value(@curr_node, "curr_node")
					node1.go_left()
					
				elsif node1.check_forward(right)
					print_mess("Went Forward Right")
					#show_value(@curr_node, "curr_node")
					node1.go_right()
					
				else
					node1.checkMaxSum()
					print_mess("wentBack")
					node1.go_back()
				end
				i += 1
				show_value(node1.getMaxPath(),"nodeMaxPath")
				show_value(node1.getNodePath().length, "node path length")
	end while !node1.getPathEnd()
end

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
	

	#node1.checkMaxSum()
	puts node1.getMaxSum()
	puts node1.getMaxPath()
	#puts node1.getNodeSum()
	#puts node1.getNodePath()


test_end(1)