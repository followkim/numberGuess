

answer <- sample(1:100, 1)
guess <- 0
guesses <- 0


print("Guess a number between 1 and 100")
while (guess != answer) {
	guessStr <- readline()
	guess <- as.integer(guessStr)
	guesses = guesses + 1

	if (guess < answer) { 
		print(paste(guessStr, "is too low!"))
	} else if (guess > answer) { 
		print(paste(guessStr, "is too high!"))
	} else {
		print(paste("You got it in", guesses, "guesses!"))
	}
}
