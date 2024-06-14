fn main() {
    struct User { 
        active: bool , 
        username: String, 
        email: String, 
        sign_in_count: u64,
    }

    let user = User {
        active: true, 
        username: String::from("username"), 
        email: String::from("email"), 
        sign_in_count: 1,
    };
}

fn build_user(email: String, username: String) -> User { 
    User { 
        active: true, 
        username, 
        email, 
        sign_in_count: 1,
    }
}
