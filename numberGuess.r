numberGuess <- function() {
	playAgain = "yes"
	max = 100
	while ((substr(playAgain, 1, 1)) == 'y') {
	
		answer <- sample(1:max, 1)
		guess <- 0
		guesses <- 0
	
		print("Guess a number between 1 and 100")
	
		while (guess != answer) {
			
			guesses = guesses + 1
			guessStr <- readline("->")
			guess <- as.integer(guessStr)

			if (guess < answer) { 
				print(paste(guessStr, "is too low!"))
			} else if (guess > answer) { 
				print(paste(guessStr, "is too high!"))
			}
		}
		print(paste("You got it in", guesses, "guesses!"))
		playAgain <- readline("Play again? [Y/N]")
	}
	print("Thanks for playing!")
}
numberGuess()
