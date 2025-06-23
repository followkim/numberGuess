CREATE SCHEMA NumberGuess ;
use NumberGuess;
DROP TABLE  IF EXISTS NumberGuess;
CREATE TABLE NumberGuess.NumberGuess (
  answer INT NOT NULL,
  guesses INT NULL DEFAULT 0,
  PRIMARY KEY (answer));

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
	INSERT INTO NumberGuess (answer) VALUES (Rand()*100);
END$$

DELIMITER ;
CALL NumberGuess.ResetGame();
CALL NumberGuess.Guess(50);
