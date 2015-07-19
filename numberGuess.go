//////////////////////////////////////////////
//											//
//	numberGuess.go							//
//	Kimberley Anne Gray						//
//	7/18/2015								//
//											//
//	A number guessing game written in Go	//
//											//
//////////////////////////////////////////////
package main 

import (
	"fmt"
	"math/rand"
	"time"
	"strconv"
)

// Parameters.  Can change to change difficulty.
const (	
	High = 100
	Low = 1
)

func main() {

	var err error
	var input string
	
 	rand.Seed( time.Now().UTC().UnixNano())	// Seed random number generator
	play_again := "Y"

	// Main loop.  Will only exit if user indicates that they don't want to continue.
	for (play_again == "Y") {
		
		// Init Game variables
		answer := Low + rand.Intn(High-Low)
		
		num_guesses := 0
		guess := 0						// Just in case the same answer is chosen.

		// Print instructions at the start of every game.
		fmt.Println("Please guess a number between", Low, "and", High)
		
		// Main game loop.
		for ((guess != answer) && (play_again == "Y")) {
			
			fmt.Scanln(&input)
			
			// Make sure guess is a number.  If so, continue with game.
			guess, err = strconv.Atoi(input)
			if err == nil {
				num_guesses++;
				if (guess < answer) {
					fmt.Println(guess, "is too low!")
				} else if (guess > answer) {
					fmt.Println(guess, "is too high!")
				} else {
					// User has guessed the correct answer, find out if they want to play again.
					fmt.Println("Correct in", num_guesses, "guesses!  Play again? [Y/n]:")
					fmt.Scanln(&play_again)
				}
				
			// If user didn't enter a number, check if they want to quit, or yell at them.
			} else {
				if (input != "q") {
					fmt.Println("Please enter a number! (q to quit)", )
				} else {
					play_again = "n"
				}
			}
		}
	}

	fmt.Println("Thanks for playing!")
}
