const std = @import("std");

fn addOne(number: i32) i32 {
    return number + 1;
}

test "expect addOne adds one to 41" {
    try std.testing.expect(addOne(41) == 42);
}

test addOne {
    try std.testing.expect(addOne(41) == 42);
}
