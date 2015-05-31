#!/usr/bin/perl

# Parameters.  Can change to change difficulty.
$high = 10;
$low = 1;

# Main loop.  Will only exit if user indicates that they don't want to continue.
do {	
	
	# Init Game variables
	$answer = int(rand($high-$low))+$low;
	$num_guesses = 0;

	# Print instructions at the start of every game.
	print "Please guess a number between " . $low . " and " . $high . "\n";
	
	# Main game loop.
	do {
		chomp($guess = <>);
		
		# Make sure guess is a number.  If so, continue with game.
		if ( $guess =~ /^\d+$/ ) { 
			$num_guesses++;
			if ($guess < $answer) {
				print $guess . " is too low!\n";
			} elsif ($guess > $answer) {
				print $guess . " is too high!\n";
			} else {
				# User has guessed the correct answer, find out if they want to play again.
				print "Correct in ".$num_guesses." guesses!  Play again? [Y/n]: ";
				chomp($play_again = <>);
			}
			
		# If user didn't enter a number, check if they want to quit, or yell at them.
		} else {
			if ($guess ne 'q') {
				print "Please enter a number! (q to quit)\n";
			}
		}
		
	} while (($guess != $answer) and ($guess ne 'q'));
	
} while ($play_again eq 'Y') and ($guess ne 'q');

print "Thanks for playing!\n";

