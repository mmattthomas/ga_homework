# searching for "fizzbuzz" turned up this article
# http://rubyquiz.com/quiz126.html
# however, I stopped from reading the author's code
# before trying myself


puts "Printing FizzBuzz"

arr = 1..100                        # create an array 1-100
arr.each do |x|                     # like a for loop, iterate through each #
	if (x % 3) == 0 && (x % 5) == 0   # % operator modulus returns 0 when number evenly divides
		print "fizzbuzz"                # if divisible by 3 and 5, print fizbuzz
	elsif (x % 5) == 0                # else if divisible by 5
		print "buzz"                    # print buzz
	elsif (x % 3) == 0                # else if divisible by 3
		print "fizz"                    # print fizz
	else                              # otherwise
		print x                         # just print the number
	end                               # end if/elsif block
	print "\n"                        # print a newline... i suppose i could've used PUTS() and avoided this
end                                 # end of the each code block
