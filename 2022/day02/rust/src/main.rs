use std::collections::HashMap;
use std::fs;

const WIN: i32 = 6;
const LOSE: i32 = 0;
const DRAW: i32 = 3;

fn get_shape_points(x: &str) -> i32 {
    return match x.chars().last().unwrap() {
        'X' => 1,
        'Y' => 2,
        'Z' => 3,
        _ => 0,
    };
}

fn get_hash_map() -> HashMap<&'static str, (i32, &'static str)> {
    let mut combos = HashMap::new();

    combos.insert("A X", (DRAW, "Z"));
    combos.insert("A Y", (WIN, "X"));
    combos.insert("A Z", (LOSE, "Y"));
    combos.insert("B X", (LOSE, "X"));
    combos.insert("B Y", (DRAW, "Y"));
    combos.insert("B Z", (WIN, "Z"));
    combos.insert("C X", (WIN, "Y"));
    combos.insert("C Y", (LOSE, "Z"));
    combos.insert("C Z", (DRAW, "X"));

    return combos;
}

fn main() {
    let input = fs::read_to_string("./src/input.txt").unwrap();
    let data = input.lines().collect::<Vec<_>>();

    let mut part_one_total = 0;
    let mut part_two_total = 0;

    let hash = get_hash_map();

    for d in data {
        let part_two_shape_to_play = hash.get(d).unwrap().1;
        let part_two_shape_points = get_shape_points(part_two_shape_to_play);
        let part_two_combination =
            format!("{} {}", d.chars().next().unwrap(), part_two_shape_to_play);
        let part_two_outcome_points = hash.get(&part_two_combination as &str).unwrap().0;

        part_one_total += get_shape_points(d) + hash.get(d).unwrap().0;
        part_two_total += part_two_shape_points + part_two_outcome_points;
    }

    println!("Part 1: {}", part_one_total);
    println!("Part 2: {}", part_two_total);
}
