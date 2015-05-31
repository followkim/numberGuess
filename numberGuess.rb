#############################################
#											#
#	numberGuess.rb							#
#	Kimberley Anne Gray						#
#	5/31/2015								#
#											#
#	A number guessing game written in Ruby	#
#											#
#############################################

# Parameters.  Can change to change difficulty.
high = 10
low = 1

# The user will change this flag when they want to quit.
play_again = 'Y'

# Main loop.  Will only exit if user indicates that they don't want to continue.
until (play_again != 'Y')
	
	# Init Game variables
	answer = rand(high-low)+low	
	num_guesses = 0
	guess = 0					# Just in case the same answer is chosen.

	# Print instructions at the start of every game.
	puts "Please guess a number between " + low.to_s + " and " + high.to_s
	
	# Main game loop.
	while ((guess.to_i != answer) and (play_again == 'Y'))
		guess = gets.chomp
		
		# Make sure guess is a number.  If so, continue with game.
		if ( guess.to_i != 0 )  
			num_guesses = num_guesses+1
			
			if (guess.to_i < answer) 
				puts guess.to_s + " is too low!"			
			elsif (guess.to_i > answer) 
				puts guess.to_s + " is too high!"
			else 
				# User has guessed the correct answer, find out if they want to play again.
				puts "Correct in "+num_guesses.to_s+" guesses!  Play again? [Y/n]: "
				play_again = gets.chomp
			end
			
		# If user didn't enter a number, check if they want to quit, or yell at them.
		else
			if (guess != 'q')
				puts "Please enter a number! (q to quit)\n"
			else 
				play_again = 'n'
			end
		end
	end
end

puts "Thanks for playing!\n";


