import scala.io.StdIn._

//> using scala 3.7.1

@main
def numberGuess(): Unit =

        val rand = new scala.util.Random
        var playAgain = "yes"


        while (playAgain.toLowerCase().startsWith("y")) {
                var answer = rand.nextInt(100)+1
                var guess = 0
                var guesses = 0

                while (guess != answer) {
                        var guessStr = readLine("Guess :>")
                        guess = guessStr.toIntOption.getOrElse(-1)
                        guesses += 1

                        if (guess < 0) {
                                println(s"Please inpoout a number!!")
                        } else if (guess < answer) {
                                println(s"$guess is too low!")
                        } else if (guess > answer) {
                                println(s"$guess is too high!")
                        }
                }
                println(s"You got it in $guesses guesses!")
                playAgain = readLine("Play again [y/n] :>")
        }
        println(s"Thank you for playing!")






