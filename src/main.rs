use std::io;

fn main() {
    let mut n = String::new();
    let mut k = String::new();

    println!("Enter number of students: ");
    io::stdin().read_line(&mut n).expect("Failed to read line!");
    
    let n: i8 = n.parse().expect("Not a number. ");

    println!("Enter k'th student to skip: ");
    io::stdin().read_line(&mut k).expect("Failed to read line!");

    let k: i8 = k.parse().expect("Not a number. ");

    let mut s = 0;
    let mut i = 1;

    while (i <= n) {
        s = 
    }
}
