const expect = @import("std").testing.expect;
const mem = @import("std").mem;

const Type = enum {
    ok,
    not_ok,
};

const c = Type.ok;

const Value = enum(u2) { zero, one, two };

test "enum ordinal value" {
    try expect(@intFromEnum(Value.zero) == 0);
    try expect(@intFromEnum(Value.one) == 1);
    try expect(@intFromEnum(Value.two) == 2);
}

const Value2 = enum(u2) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
};

test "set enum ordinal value" {
    try expect(@intFromEnum(Value2.hundred) == 100);
    try expect(@intFromEnum(Value2.thousand) == 1000);
    try expect(@intFromEnum(Value2.million) == 1000000);
}

const Value3 = enum(u4) {
    a,
    b = 8,
    c,
    d = 4,
    e,
};

test "enum implicit ordinal values and overriden values" {
    try expect(@intFromEnum(Value3.a) == 0);
    try expect(@intFromEnum(Value3.b) == 8);
    try expect(@intFromEnum(Value3.c) == 9);
    try expect(@intFromEnum(Value3.d) == 4);
    try expect(@intFromEnum(Value3.e) == 5);
}

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,

    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

test "enum method" {
    const p = Suit.spades;
    try expect(!p.isClubs());
}

const Foo = enum { string, number, none };

test "enum switch" {
    const p = Foo.number;
    const what_is_it = switch (p) {
        Foo.string => "This is a string",
        Foo.number => "This is a number",
        Foo.none => "This is a none",
    };

    try expect(mem.eql(u8, what_is_it, "this is a number"));
}

const Small = enum {
    one,
    two,
    three,
    four,
};

test "std.meta.Tag" {
    try expect(@typeInfo(Small).@"enum".tag_type == u2);
}
