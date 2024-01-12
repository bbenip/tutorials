fn main() {
    // Mutable variables
    let mut x = 5;
    println!("The value of x is: {x}");

    x = 6;
    println!("The value of x is: {x}");

    // Variable shadowing
    let y = 3;
    let y = y + 1;

    {
        let y = y * 2;
        println!("The value of y in the inner scope is: {y}");
    }

    println!("The value of y is: {y}");

    let mut filler = "xx";
    println!("The value of filler is: {filler}");

    filler = "xxxxxx";
    println!("The value of filler is: {filler}");

    // Without variable shadowing, the value requires
    // the same type on assignment
    let filler = filler.len();
    println!("The value of filler is: {filler}");
}
