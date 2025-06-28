import scala.io.StdIn._


val rand = new scala.util.Random

var answer = rand.nextInt(100)+1
var guess = 0
var guesses = 0

println(s"$answer")

while (guess != answer) {
  var guessStr = readLine("Prompt :>")
  guess = guessStr.toIntOption.getOrElse(-1)
  guesses += 1
  
  if (guess < answer) {
    println(s"$guess is too low!")
  } else if (guess > answer) {
    println(s"$guess is too high!")
  }
}
println(s"You got it in $guesses guesses!")
