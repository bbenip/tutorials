fn main() {
    // Type annotation
    let _parsed_number: u32 = "42".parse().expect("Not a number!");
    let _a: bool = true;
    let _b: char = '🤩';

    // Default types
    let _c = 1; // Default integer type is i32
    let _d = 2.0; // Default floating type is f64

    // Tuples
    let tup: (i32, f64, u8) = (1000, -2.3, 8);
    let (_e, _f, _g) = tup; // Destructuring

    let _h = tup.0; // 0-indexed; h holds first value in tup

    let _unit_tuple: () = ();

    // Arrays
    let i: [i32; 5] = [5, 3, 2, 1, 4];
    let _j = [0; 10]; // Initialize array with default value

    let _k = i[2]; // 0-indexed array; k holds third value in i

    // Out-of-bounds indexing will cause the program to panic
}
