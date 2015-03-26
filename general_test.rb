 require_relative "method_tester.rb"

 test_start(1)
	 ar = Array.new()
	 ar[0] = 12
	  if ar.empty? 
	  	puts "Empty"
	  else
	  	puts "No"
	  end
	 puts ar
	 ar.pop
	 if ar.empty?
	 	puts "Empty"
	 else
	 	puts "not Empty" 
	 end
 test_end(1)

 test_start(2)
 	a = [6,7].max
 	puts a
 test_end(1)

 test_start(3)
 a = [1, 2, 3]
 b = [4, 5, 6]
 a = b
 puts a
 test_end(3)