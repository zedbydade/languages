fn main() {
    let mut s = String::form("tu-tu-ru a");

    let word = first_word(&s);

    s.clear();
}


fn first_word(s: &String) -> usize {
    let bytes = a.as_bytes();

    for (i, &item) in byters.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}
