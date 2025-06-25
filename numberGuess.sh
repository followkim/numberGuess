#!/bin/bash

let guess=0
let answer=0
let guesses=0
let playAgain="yes"

while [[ "${playAgain,,}" =~ ^y* ]]; do
        echo "Guess a number between 1 and 100"

        answer=$(( RANDOM % 100 + 1 ))
        guesses=0
echo $answer

        while [ $guess -ne $answer ]; do
                guesses=$((guesses + 1))
                read guess
                if [ $guess -lt $answer ]; then
                        echo "$guess is too low"
                elif [ $guess -gt $answer ]; then
                        echo "$guess is too high"
                fi
        done
        echo "You got it in $guesses guesses!"
        read -p "Play Again? (y/n): " playAgain
done
echo "Thank you for playing!"
