const rl = @import("raylib");

pub fn main() void {
    const screen_with = 800;
    const screen_height = 800;

    rl.initWindow(screen_with, screen_height, "Zig Invaders");
    defer rl.closeWindow();

    rl.setTargetFPS(60);
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);
        rl.drawText(
            "Zig Invaders",
            300,
            300,
            40,
            rl.Color.green,
        );
    }
}
