CREATE SCHEMA NumberGuess ;
use NumberGuess;
DROP TABLE  IF EXISTS NumberGuess;
CREATE TABLE NumberGuess.NumberGuess (
  answer INT NOT NULL,
  guesses INT NULL DEFAULT 0,
  PRIMARY KEY (answer));
INSERT INTO NumberGuess (answer) VALUES ((Rand()*100)+1);
DROP PROCEDURE IF EXISTS Guess;

DELIMITER $$
CREATE PROCEDURE Guess (in guess int)
BEGIN
	UPDATE NumberGuess set guesses = guesses + 1;
	select 
		case 
			when guess < answer then CONCAT(guess, ' is too low!')
			when guess > answer then CONCAT(guess, ' is too high!') 
			else Concat('You got it in ', guesses, ' guesses!')
		end
	FROM NumberGuess;
END$$

DROP procedure IF EXISTS ResetGame;
DELIMITER $$
CREATE PROCEDURE ResetGame ()
BEGIN
	UPDATE NumberGuess SET answer = (Rand()*100)+1, guesses = 0;
	select "Choose a number between 1 and 100"; 
END$$

CALL NumberGuess.ResetGame();
CALL NumberGuess.Guess(50);
