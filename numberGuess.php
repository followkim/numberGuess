<?php
	do {
		$answer = rand(1, 101);
		$guesses = 0;
		do {
			echo "Guess a number between 1 and 100: ";
			fscanf(STDIN, "%d\n", $guess);
			$guesses += 1;
			if ($guess < $answer) echo $guess . " is too low!\n";
			elseif ($guess > $answer) echo $guess . " is too high!\n";
		} while ($answer != $guess);
		echo "You won in " . $guesses .  " guesses!\n";
		echo "Play again? (y/n): ";
		$playAgain = trim(fgets(STDIN));
	} while (substr(strtolower($playAgain), 0, 1) == 'y');
?>

