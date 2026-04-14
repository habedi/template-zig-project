const std = @import("std");
const root = @import("root.zig");

pub fn main(init: std.process.Init.Minimal) !void {
    const result = root.add(10, 5);
    std.debug.print("Result of add(10, 5) is: {}\n", .{result});

    root.greet("World");

    var args = std.process.Args.Iterator.init(init.args);
    defer args.deinit();

    var count: usize = 0;
    std.debug.print("\nCommand line arguments:\n", .{});
    while (args.next()) |arg| {
        std.debug.print("  Arg: {s}\n", .{arg});
        count += 1;
    }

    if (count < 2) {
        std.debug.print(
            "\nTry running with arguments: ./zig-out/bin/template-zig-project arg1 arg2\n",
            .{},
        );
    }
}
