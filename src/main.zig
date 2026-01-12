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
    screen_width: i32,
    screen_height: i32,
    player_width: f32,
    player_height: f32,
    player_start_y: f32,
    bullet_width: f32,
    bullet_height: f32,
    shield_start_x: f32,
    shield_y: f32,
    shield_width: f32,
    shield_height: f32,
    shield_spacing: f32,
    invader_start_x: f32,
    invader_start_y: f32,
    invader_width: f32,
    invader_height: f32,
    invader_spacing_x: f32,
    invader_spacing_y: f32,
};

// @This = builtin Function, is the same as Example
const Example = struct {
    value: i32,
    /// init is a convention for constructor functions
    pub fn init(starting_value: i32) @This() {
        return .{
            .value = starting_value,
        };
    }

    // @This() -> Read only
    // *@This() -> Write (modify)
    pub fn update(self: *@This()) void {
        self.value += 1;
    }
};

const Player = struct {
    position_x: f32,
    position_y: f32,
    width: f32,
    height: f32,
    speed: f32,

    pub fn init(
        position_x: f32,
        position_y: f32,
        width: f32,
        height: f32,
    ) @This() {
        return .{
            .position_x = position_x,
            .position_y = position_y,
            .width = width,
            .height = height,
            .speed = 5.0,
        };
    }
};

pub fn main() void {
    const screen_width = 800;
    const screen_height = 800;

    rl.initWindow(screen_width, screen_height, "Zig Invaders");
    defer rl.closeWindow();

    const player_width = 50.0;
    const player_height = 30.0;

    var player = Player.init(
        @as(f32, @floatFromInt(screen_width)) / 2 - player_width / 2,
        @as(f32, @floatFromInt(screen_height)) - 60.0,
        player_width,
        player_height,
    );

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
