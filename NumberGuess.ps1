param([string]$high=100) #Must be the first statement in your script

# Parameters.  Can change to change difficulty.
$high = [int]$high
$low = 1

# The user will change this flag when they want to quit.
$play_again = 'Y'

# Main loop.  Will only exit if user indicates that they don't want to continue.
while ($play_again -eq 'Y') {	
	
	# Init Game variables
	$answer = Get-Random -Minimum $low -Maximum $high
    echo $answer
	$num_guesses = 0
	$guess = 0					# Just in case the same answer is chosen.

	# echo instructions at the start of every game.
	$s =  "Please guess a number between " + $low + " and " + $high
	echo $s

	# Main game loop.
	while (($guess -ne $answer) -and ($play_again.Substring(0,1).ToUpper() -eq 'Y')) {
        $guess = Read-Host ">"
		
		# Make sure guess is a number.  If so, continue with game.
		if ( $guess -match '^\d+$' ) { 
            $guess = [int]$guess
			$num_guesses++
			if ($guess -lt $answer) {
				$s = $guess.ToString() + " is too low!"
			} elseif ($guess -gt $answer) {
				$s =  $guess.ToString() + " is too high!"
			} else {
				# User has guessed the correct answer, find out if they want to play again.
				$s = "Correct in " + $num_guesses.ToString() + " guesses!"
			}

            echo $s
            if ($guess -eq $answer) {
    			$play_again = Read-Host "Play again? [Y/n]"
            }
			
		# If user didn't enter a number, check if they want to quit, or yell at them.
		} else {
			if ($guess -ne 'q') {
				echo "Please enter a number! (q to quit)"
			} else {
				$play_again = 'n'
			}
		}
	}
}

echo "Thanks for playing!"
