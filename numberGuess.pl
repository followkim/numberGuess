#!/usr/bin/perl

#############################################
#											#
#	numberGuess.pl							#
#	Kimberley Anne Gray						#
#	5/30/2015								#
#											#
#	A number guessing game written in Perl	#
#											#
#############################################

# Parameters.  Can change to change difficulty.
$high = 10;
$low = 1;

# The user will change this flag when they want to quit.
$play_again = 'Y';

# Main loop.  Will only exit if user indicates that they don't want to continue.
while ($play_again eq 'Y') {	
	
	# Init Game variables
	$answer = int(rand($high-$low))+$low;
	$num_guesses = 0;
	$guess = 0;					# Just in case the same answer is chosen.

	# Print instructions at the start of every game.
	print "Please guess a number between " . $low . " and " . $high . "\n";
	
	# Main game loop.
	while (($guess != $answer) and ($play_again eq 'Y')) {
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
			} else {
				$play_again = 'n';
			}
		}
	}
}

print "Thanks for playing!\n";

