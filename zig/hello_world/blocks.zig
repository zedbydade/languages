const std = @import("std");
const expect = std.testing.expect;

test "labeled break from labeled block expression" {
    var y: i32 = 123;

    const x = blk: {
        y += 1;
        break :blk y;
    };

    try expect(x == 1234);
    try expect(y == 1234);
}
