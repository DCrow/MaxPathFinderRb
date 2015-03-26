require_relative "node_lookup.rb"
require_relative "method_tester.rb"
require_relative "path_finder.rb"

# Load data
data_ar = parse_data_array(read_file("test_file2.txt"))
data_ar_m = parse_data(read_file("test_file2.txt"))
#show_value(data_ar,"test_file2")
puts data_ar
colls = numOfCollumns(read_file("test_file2.txt"))
show_value(colls, "Collumns")


test_start(1)

	node1 = Node.new(data_ar, numOfCollumns(read_file("test_file2.txt")), 0)
	puts node1.showDataArray()
	node1.findMaxSumPath()
	puts Node.maxNodeSum
test_end(1)