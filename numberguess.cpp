#include <iostream>
#include <cstdlib>
#include <cctype>

using namespace std;

class NumberGuess {
	private:
		int answer;
		int numGuesses;
	public:
		NumberGuess() {
			answer = rand()%100;
			numGuesses = 0;
		}

		int Guess(int guess) {
			numGuesses += 1;
			if (guess < answer) {
				return -1;
			} else if (guess > answer) {
				return 1;
			} else {
				return 0;
			}
		}
		int Guesses() {
			return numGuesses;
		}
};



int main()
{
	string playAgain = "Y";
	int guess;
	int ngr;

	while (tolower(playAgain[0]) == 'y') {
		NumberGuess ng;
		do {
			cout << "Please guess a number: ";
			cin >> guess;
			ngr = ng.Guess(guess);
			if (ngr < 0) {
				cout << guess << " is too low!" << endl;
			} else if (ngr > 0) {
				cout << guess << " is too high!!" << endl;
			}
		} while (ngr != 0);
		cout << "Guessed it after " << ng.Guesses() << " guesses!" << endl;
		cout << "Play again? ";
		cin >> playAgain;
	}
	return 0;
}

