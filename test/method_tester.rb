def test_start(num)
	puts "---------------------------"
	puts "Start Test #{num}"
end

def test_end(num)
	puts "End Test #{num}"
	puts "---------------------------"
end

def show_value(obj_value, obj_name)
	puts "The value of #{obj_name} is #{obj_value}"
end

def print_mess(obj_name)
	puts "#{obj_name}"
end

def show_value_bool(obj_value, obj_name)
	if obj_value
			puts "The value of #{obj_name} is true"
		else
			puts "The value of #{obj_name} is false"
		end
end