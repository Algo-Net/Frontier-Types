module frontier_types::region;

use frontier_types::position::Position;
use std::string::String;

public struct Region has store {
    id: u32,
    name: String,
    center: Position,
}

public fun define(id: u32, name: String, center: Position): Region {
    Region {
        id,
        name,
        center,
    }
}

public fun clone(region: &Region): Region {
    Region {
        id: region.id,
        name: region.name,
        center: region.center.clone(),
    }
}

public fun destroy(region: Region) {
    let Region {
        id: _,
        name: _,
        center,
    } = region;

    center.destroy();
}

// Getters
public fun id(region: &Region): u32 {
    region.id
}

public fun name(region: &Region): String {
    region.name
}

public fun center(region: &Region): &Position {
    &region.center
}

public fun center_mut(region: &mut Region): &mut Position {
    &mut region.center
}

// Setters
public fun set_name(region: &mut Region, value: String) {
    region.name = value;
}

public fun set_center(region: &mut Region, value: &Position) {
    let position = region.center_mut();
    position.set_x(value.x());
    position.set_y(value.y());
    position.set_z(value.z());
}
