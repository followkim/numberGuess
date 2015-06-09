#################################################
#												#
#	numberGuess.py								#
#	Kimberley Anne Gray							#
#	5/31/2015									#
#												#
#	A number guessing game written in Python	#
#												#
#################################################
import random

# Parameters.  Can change to change difficulty.
high = 10
low = 1

# The user will change this flag when they want to quit.
play_again = 'Y'

# Main loop.  Will only exit if user indicates that they don't want to continue.
while (play_again == 'Y'):
	
	# Init Game variables
	answer = random.randint(low, high)
	num_guesses = 0
	guess = 0					# Just in case the same answer is chosen.

	# Print instructions at the start of every game.
	print ("Please guess a number between %d and %d" % (low, high))
	
	# Main game loop.
	while ((int(guess) != answer) and (play_again == 'Y')):
		guess_input = raw_input()
		
		# Make sure guess is a number.  If so, continue with game.
		if (guess_input.isdigit()):
			guess = int(guess_input)
			num_guesses = num_guesses+1
			
			if (guess < answer):
				print("%d is too low!" % guess)		
			elif (guess > answer):
				print("%d is too high!" % guess)
			else:
				# User has guessed the correct answer, find out if they want to play again.
				print ("Correct in %d guesses!  Play again? [Y/n]: " % num_guesses)
				play_again = raw_input()
			
		# If user didn't enter a number, check if they want to quit, or yell at them.
		else:
			if (guess_input != 'q'):
				print "Please enter a number! (q to quit)"
			else:
				play_again = 'n'
			
print "Thanks for playing!";


