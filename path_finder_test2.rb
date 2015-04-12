require_relative "path_finder.rb"
require_relative "test/method_tester.rb"
require_relative "node_lookup.rb"

def delete_file(file_name)
	File.delete(file_name)
end

test_start(1)
#delete_file("text.txt")
f1 = DataChanger.new("test/test_in/test_file2.txt")
#puts f1.parse_data_array()
#puts f1.getNumOfCollumns()
data_ar = f1.parse_data_array()
col_num = f1.get_num_cools()
n1 = Node.new(data_ar)
n1.find_max_sum_path()
puts n1.get_node_max_path()
puts n1.get_node_max_sum()
f1.write_file("test/test_out/test_file_out.txt", n1.get_node_max_path())

test_end(1)