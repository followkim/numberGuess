#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>

int main (int argc, char *argv[]) {
	int answer ;
	int guess = 0;
	int numGuesses;
	char playAgain[50];
	int maxRand;

	if (argc > 1) {
		maxRand = atoi(argv[1]);
	} else {
		maxRand = 100;
	}

	srand(time(NULL));
	playAgain[0] = 'y';
	while (tolower(playAgain[0]) == 'y') {
		answer = (rand()+1) % 100;
		numGuesses = 0;
		printf("answer: %d\n", answer);
		while (guess != answer) {
			printf("Enter a guess: ");
			scanf("%d", &guess);
			numGuesses += 1;
			if (guess < answer) {
				printf("%d is too low!\n", guess);
			} else if (guess > answer) {
				printf("%d is too high!\n", guess);
			}
		}
		printf("You guessed it in %d guesses!\n", numGuesses) ;
		printf("Play again? (y/n)");
		scanf("%s", playAgain);
	}
	printf("Thanks for playing!");
	return 0;

}

