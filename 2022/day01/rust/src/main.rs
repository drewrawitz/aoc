use std::fs;

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

    let top_three_sum: u32 = data.iter().take(3).sum();

    println!("Part 1: {:?}", data[0]);
    println!("Part 2: {:?}", top_three_sum);
}
