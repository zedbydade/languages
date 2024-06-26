fn main() {
    let mut x = 5;
    println!("The value of x is: {x}");
    x = 6;
    print!("The value of x is: {x}");

    let x = 5;

    let x = x + 1;

    {
        let x = x * 2;
        println!("The value of x in the inner scope is: {x}");
    }

    println!("The value of x is: {x}");

    let x = 2.0;
    let y: f32 = 3.0;

    let sum = 5 + 10;

    let difference = 95.5 - 4.3;

    let product = 4 * 30;

    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3;

    let remainder = 43 % 5;

    let t = true;

    let f: bool = false;

    let c = 'z';

    let z: char = 'Z';

    let tup: (i32, f64, u8) = (500, 6.4, 1);

    let (x, y, z) = tup;

    let five_hundred = tup.0;

    let a = [1, 2, 3, 4, 5, 6];

    let a: [i32; 5] = [1, 2, 3, 4, 5];

    let first = a[0];
    let second = a[1];
    another_function();

    let number = 3;

    if number < 5 {
        print!("Condition was true");
    } else {
        println!("condition was false");
    }
}


fn another_function() {
    println!("Another function");
}
