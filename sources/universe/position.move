module frontier_types::position;

use std::string::String;

public struct Position has store {
    x: String,
    y: String,
    z: String,
}

public fun define(x: String, y: String, z: String): Position {
    Position { x, y, z }
}

public fun clone(position: &Position): Position {
    Position {
        x: position.x,
        y: position.y,
        z: position.z,
    }
}

public fun destroy(position: Position) {
    let Position { x: _, y: _, z: _ } = position;
}

// Getters
public fun x(position: &Position): String {
    position.x
}

public fun y(position: &Position): String {
    position.y
}

public fun z(position: &Position): String {
    position.z
}

// Setters
public fun set_x(position: &mut Position, value: String) {
    position.x = value;
}

public fun set_y(position: &mut Position, value: String) {
    position.y = value;
}

public fun set_z(position: &mut Position, value: String) {
    position.z = value;
}
