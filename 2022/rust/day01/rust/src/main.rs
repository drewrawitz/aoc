use std::fs;

type Input = Vec<u32>;

fn max_item(input: &Input) -> &u32 {
    input.iter().max().unwrap()
}

fn sum_of_top_three(input: &Input) -> u32 {
    input.iter().take(3).sum()
}

fn main() {
    let input = fs::read_to_string("./src/input.txt").unwrap();
    let lines = input.split("\n\n");

    let mut data: Vec<u32> = lines
        .map(|line| {
            line.split("\n")
                .flat_map(|num| num.parse::<u32>())
                .sum::<u32>()
        })
        .collect();

    data.sort_by(|a, b| b.cmp(a));

    println!("Part 1: {:?}", max_item(&data));
    println!("Part 2: {:?}", sum_of_top_three(&data));
}
