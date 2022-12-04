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

fn get_part_one_hash_map() -> HashMap<&'static str, i32> {
    let mut combos = HashMap::new();

    combos.insert("A X", DRAW);
    combos.insert("A Y", WIN);
    combos.insert("A Z", LOSE);
    combos.insert("B X", LOSE);
    combos.insert("B Y", DRAW);
    combos.insert("B Z", WIN);
    combos.insert("C X", WIN);
    combos.insert("C Y", LOSE);
    combos.insert("C Z", DRAW);

    return combos;
}

fn get_part_two_hash_map() -> HashMap<&'static str, &'static str> {
    let mut combos = HashMap::new();

    combos.insert("A X", "Z");
    combos.insert("A Y", "X");
    combos.insert("A Z", "Y");
    combos.insert("B X", "X");
    combos.insert("B Y", "Y");
    combos.insert("B Z", "Z");
    combos.insert("C X", "Y");
    combos.insert("C Y", "Z");
    combos.insert("C Z", "X");

    return combos;
}

fn main() {
    let input = fs::read_to_string("./src/input.txt").unwrap();
    let data = input.lines().collect::<Vec<_>>();

    let mut part_one_total = 0;
    let mut part_two_total = 0;
    let part_one_hash = get_part_one_hash_map();
    let part_two_hash = get_part_two_hash_map();

    for d in data {
        let part_one_outcome_points = part_one_hash.get(d).unwrap();
        let part_one_shape_points = get_shape_points(d);

        let part_two_shape_to_play = part_two_hash.get(d).unwrap();
        let part_two_shape_points = get_shape_points(part_two_shape_to_play);
        let part_two_combination =
            format!("{} {}", d.chars().next().unwrap(), part_two_shape_to_play);
        let part_two_outcome_points = part_one_hash.get(&part_two_combination as &str).unwrap();

        part_one_total += part_one_shape_points + part_one_outcome_points;
        part_two_total += part_two_shape_points + part_two_outcome_points;
    }

    println!("Part 1: {}", part_one_total);
    println!("Part 2: {}", part_two_total);
}
