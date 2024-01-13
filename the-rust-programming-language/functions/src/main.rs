fn main() {
    println!("Hello, World!");

    function_1();
    function_2(10);

    print_sum(2, -4);

    let a = {
        let b = 1;
        b + 1
    };

    println!("The value of a is: {a}");

    let c = plus_one(10);

    println!("The value of c is: {c}");
}

fn function_1() {
    println!("Another function")
}

fn function_2(x: i32) {
    println!("The value of x is: {x}");
}

fn print_sum(n1: i32, n2: i32) {
    println!("The sum of the inputs is: {}", n1 + n2);
}

fn plus_one(x: i32) -> i32 {
    x + 1
}
