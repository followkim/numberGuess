#!/usr/bin/perl

# Parameters
$high = 100;
$low = 1;
$play_again = 0;

do {	
	
	# Init Game variables
	$answer = int(rand($high-$low))+$low;
	$num_guesses = 0;

	# Print instructions at the start of every game.
	print "Please guess a number between " . $low . " and " . $high . "\n";
	
	# Main game loop.
	do {
		chomp($guess = <>);
		$num_guesses++;
		if ($guess < $answer) {
			print $guess . " is too low!\n";
		} elsif ($guess > $answer) {
			print $guess . " is too high!\n";
		}
	} while ($guess != $answer);

	# User has guessed the correct answer, find out if they want to play again.
	print "Correct in ".$num_guesses." guesses!  Play again? [Y/n]: ";
	chomp($play_again = <>);
	
} while ($play_again eq 'Y');

print "Thanks for playing!\n";

