require_relative "node_lookup.rb"
require_relative "method_tester.rb"
require_relative "path_finder.rb"

data_ar = parse_data_array(read_file("test_file2.txt"))
show_value(data_ar,"test_file2")