use std::collections::HashMap;
use std::fs;

fn get_shape_points(x: &str) -> i32 {
    return match x.chars().last().unwrap() {
        'X' => 1,
        'Y' => 2,
        'Z' => 3,
        _ => 0,
    };
}

fn get_hash_map() -> HashMap<&'static str, i32> {
    const WIN: i32 = 6;
    const LOSE: i32 = 0;
    const DRAW: i32 = 3;

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

fn main() {
    let input = fs::read_to_string("./src/input.txt").unwrap();
    let data = input.lines().collect::<Vec<_>>();

    let mut total = 0;
    let hash = get_hash_map();

    for d in data {
        let outcome_points = hash.get(d).unwrap();
        let shape_points = get_shape_points(d);

        total += shape_points + outcome_points;
    }

    println!("{}", total)
}
