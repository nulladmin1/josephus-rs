use std::{io, usize};

fn main() {
    let mut n = String::new();
    let mut k = String::new();

    println!("Enter number of students: ");
    io::stdin().read_line(&mut n).expect("Failed to read line!");
    
    let n: usize = n.trim().parse().expect("Not a number. ");

    println!("Enter k'th student to skip: ");
    io::stdin().read_line(&mut k).expect("Failed to read line!");

    let k: usize = k.trim().parse().expect("Not a number. ");

    let mut s = 0;

    for i in 1..=n {
        s = (s + k) % i;
    }

    println!("The winner is: {}", s+1);
}
