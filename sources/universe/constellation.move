module frontier_types::constellation;

use frontier_types::position::Position;
use std::string::String;

public struct Constellation has store {
    id: u32,
    name: String,
    region_id: u32,
    center: Position,
}

public fun define(id: u32, name: String, region_id: u32, center: Position): Constellation {
    Constellation {
        id,
        name,
        region_id,
        center,
    }
}

public fun clone(constellation: &Constellation): Constellation {
    Constellation {
        id: constellation.id,
        name: constellation.name,
        region_id: constellation.region_id,
        center: constellation.center.clone(),
    }
}

public fun destroy(constellation: Constellation) {
    let Constellation {
        id: _,
        name: _,
        region_id: _,
        center,
    } = constellation;

    center.destroy()
}

// Getters
public fun id(constellation: &Constellation): u32 {
    constellation.id
}

public fun name(constellation: &Constellation): String {
    constellation.name
}

public fun region_id(constellation: &Constellation): u32 {
    constellation.region_id
}

public fun center(constellation: &Constellation): &Position {
    &constellation.center
}

public fun center_mut(constellation: &mut Constellation): &mut Position {
    &mut constellation.center
}

// Setters
public fun set_name(constellation: &mut Constellation, value: String) {
    constellation.name = value;
}

public fun set_region_id(constellation: &mut Constellation, value: u32) {
    constellation.region_id = value;
}

public fun set_center(constellation: &mut Constellation, value: &Position) {
    let position = constellation.center_mut();
    position.set_x(value.x());
    position.set_y(value.y());
    position.set_z(value.z());
}
