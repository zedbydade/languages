fn main() {
    let mut s = String::from("tu-tu");

    s.push_str("-ru");

    println!("{s}");

    let x = 5;
    let y = x;

    let s1 = String::from("hello");
    let s2 = s1;

    let tu = String::from("tutu-ru");

    takes_ownership(tu);

    let x = 5;

    makes_copy(x);

    let s1 = String::from("tuturu");

    let len = calcualte_length(&s1);
}

fn calcualte_length(s: &String) -> usize { 
    s.len()
}

fn takes_ownership(some_stirng: String) {
    println!("{some_string}");
}

fn makes_copy(some_integer: i32) {
    println!("#{some_integer}");
}
