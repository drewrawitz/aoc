extern crate array_tool;

use array_tool::vec::Intersect;
use std::fs;

fn main() {
    let input = fs::read_to_string("./src/input.txt").unwrap();
    let data = input.lines().collect::<Vec<_>>();
    let mut sum = 0;

    let alphabet = ('a'..='z').into_iter().collect::<Vec<char>>();

    println!("{:?}", data);

    // Part One
    for item in &data {
        let chars = item.len();
        let half = chars / 2;
        let s = item.split_at(half);
        let first_half: Vec<_> = s.0.chars().collect();
        let second_half: Vec<_> = s.1.chars().collect();
        let common = first_half.intersect(second_half)[0];
        let add_to = if common.is_uppercase() { 27 } else { 1 };

        let priority = alphabet
            .iter()
            .position(|&r| r == common.to_lowercase().nth(0).unwrap())
            .unwrap()
            + add_to;

        sum += priority;
    }

    // Part Two
    for chunk in data.chunks(3) {
        let t: Vec<_> = chunk.iter().map(|r| println!("{}", r));
    }

    println!("{:?}", sum);
}
