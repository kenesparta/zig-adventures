const rl = @import("raylib");

const Rectangle = struct {
    x: f32,
    y: f32,
    width: f32,
    height: f32,

    /// We can use this method something like this:
    /// rect1.intersects(rect2)
    /// or:
    /// Rectangle.intersects(rect1, rect2)
    pub fn intersects(self: Rectangle, other: Rectangle) bool {
        return self.x < other.x + other.width and
            self.x + self.width > other.x and
            self.y < other.y + other.height and
            self.y + self.height > other.y;
    }
};

const GameConfig = struct {
    screenWith: i32,
    screenHeight: i32,
    playerWidth: f32,
    playerHeight: f32,
    playerStartY: f32,
    bulletWidth: f32,
    bulletHeight: f32,
    shieldStartX: f32,
    shieldY: f32,
    shieldWidth: f32,
    shieldHeight: f32,
    shieldSpacing: f32,
    invaderStartX: f32,
    invaderStartY: f32,
    invaderWidth: f32,
    invaderHeight: f32,
    invaderSpacingX: f32,
    invaderSpacingY: f32,
};

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
