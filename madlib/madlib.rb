# Madlib excercise v2
# 1. Menu prompt: a.) load madlib, b.) prompt variables
# parse sentence for (()) tags, break into arrays with .scan()
# regex to parse out (()) tags : \(\(([\w\s]+)*\)\)  
# Our favorite language is ((animal)). We think ((gemstone)) is better than ((language)).

class MadLib

	@@mlibs = []

	#default sentence:
	@@sentence = "Our favorite language is ((animal)). We think ((gemstone)) is better than ((language))"

	def initialize()
	end

	def load_sentence()
		
		puts "Your sentence should use double parenthesese for entries.  e.g.: I ((verb)) this game."
		puts "Please paste/type your sentence or paragraph here and press enter:"
		@@sentence = gets.chomp
	end

	def play_game()

		i = 0	#sentence character count

		#bust out all the ((placeholders)) !
		@@mlibs = @@sentence.scan(/\(\(([\w\s]+)*\)\)/)

		#iterate array, ask and put answers into second param of subarray 
		@@mlibs.each do |a|
			print "Please provide a #{a[0]}:" 
			a[1] = gets.chomp

			@@sentence.sub!("((#{a[0]}))", a[1])	#find/replace on the fly each one
		end

		puts "Here is your Mad Lib!\n\n"
		puts @@sentence

	end

	def start()

		user_option = menu

		if user_option == 1
			play_game
		end
		if user_option == 2
			load_sentence
		end
		if user_option == 3
			puts "\nThanks for playing..."
			exit
		end

		start	#over

	end

	def menu()
		puts ""
		puts "Welcome to the Madlib App."
		puts "Please choose an option:"
		puts " 1. Play the Game "
		puts " 2. Use your own sentence!"
		puts " 3. Quit"
		puts ""
		print "Enter selection: "
		menu_select = gets.chomp
		if menu_select.to_i > 0 && menu_select.to_i < 4
			menu_select.to_i
		else
			puts "Invalid Selection!!"
			exit
		end
	end

end

mad_lib = MadLib.new()
mad_lib.start()
#puts "You have selected #{s}!"
