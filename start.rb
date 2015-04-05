require_relative "path_finder.rb"
require_relative "node_lookup.rb"

def start()
	puts "Welcome to my Max Path Ruby App."
	puts "Please input a path to your file."
	input = gets.chomp
	output = input.slice(0..input.length-5) + "_out.txt"
	puts input.length-5
	f1 = DataChanger.new(input)
	n1 = Node.new(f1.parse_data_array())
	n1.find_max_sum_path()
	f1.write_file(output, n1.get_node_max_path())
	puts "Your result is in #{output}"
end

start()