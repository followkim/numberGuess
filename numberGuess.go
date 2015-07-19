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
	"os"
	"flag"
)

// Default parameters.
const (
	Low = 1
	High = 100
)

func main() {

	var err error
	var input string
	
	// Set up the flags with default values
	lowPtr := flag.Int("low", Low, "Lowest possible answer")
	highPtr := flag.Int("high", High, "Highest possible answer")
	flag.Parse()
	  
	// Collect the command-line variables
	low := *lowPtr
	high := *highPtr
	
	// Check that we are working with valid parameters
	if (high <= low) {
		fmt.Println("Error: low value must be less then high value!")
		os.Exit(-1)
	}
	
	// Seed random number generator
 	rand.Seed( time.Now().UTC().UnixNano())	
 	
 	// Flag used to indicate that we should stop game
	play_again := "Y"

	// Main loop.  Will only exit if user indicates that they don't want to continue.
	for (play_again == "Y") {
		
		// Init number to guess
		answer := low + rand.Intn(high-low)
		
		num_guesses := 0
		guess := 0						// Just in case the same answer is chosen.

		// Print instructions at the start of every game.
		fmt.Println("Please guess a number between", low, "and", high)
		
		// Main game loop.
		for ((guess != answer) && (play_again == "Y")) {
			
			// GEt input from user
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
