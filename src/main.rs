use std::io;

fn main() {
    let mut n = String::new();
    let mut k = String::new();

    println!("Enter number of students: ");
    io::stdin().read_line(&mut n).expect("Failed to read line!");
}
