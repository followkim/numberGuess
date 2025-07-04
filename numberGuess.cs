using System;

public class NumberGuess
{
    public static void Main()
    {
        Random rnd = new Random();
        string playAgain = "yes";


        while ((!string.IsNullOrEmpty(playAgain)) && (playAgain.ToLower().Substring(0, 1) == "y"))
        {
            int guess = 0;
            int guesses = 0;
            int answer = rnd.Next(0, 100) + 1;
            Console.WriteLine("Guess a number between 1 and 100: ");
            while (guess != answer && (playAgain.ToLower().Substring(0, 1) != "q"))
            {
                playAgain = Console.ReadLine();
                if (!string.IsNullOrEmpty(playAgain) && int.TryParse(playAgain, out guess))
                {
                    guesses += 1;
                    if (answer > guess )
                    {
                        Console.WriteLine(guess + " is too low!");
                    }
                    else if (answer < guess)
                    {
                        Console.WriteLine(guess + " is too high!");
                    }
                    else
                    {
                        Console.WriteLine("You got it in " + guesses + " guesses!");
                        Console.WriteLine("Play again? (Y/N)");
                        playAgain = Console.ReadLine();
                    }
                }

                else {
                    Console.WriteLine("Please guess a number, or type 'q' to quit.");
                    if (string.IsNullOrEmpty(playAgain)) { playAgain = "none"; }
                }
            }
        }
        Console.WriteLine("Thanks for playing!");
    }
}
