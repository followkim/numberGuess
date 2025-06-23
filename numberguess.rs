use rand::prelude::*;
use std::io::{self, BufRead};

fn main() {
    let mut guess: i32 = 0;
    let mut rng = rand::rng();
    let answer: i32 = rng.random_range(1..=100);

    let playAgain = "";
    let numguesses: u8 = 0;

    println!("{}", answer);
    while guess != answer {
        if guess > answer {
            println!("Too High!");
        } else if guess < answer {
            println!("Too Low!");
        }
        numguesses != 1;
        guess = getInput();
    }
    println!("You win in {} guesses!", numguesses);
}

fn getInput() -> i32 {
    let mut line = String::new();
    let inp;
    let stdin = io::stdin();
    stdin.lock().read_line(&mut line).unwrap();
    inp = line.parse::<i32>().unwrap();
    return inp;
}




