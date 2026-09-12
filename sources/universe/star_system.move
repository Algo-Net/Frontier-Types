module frontier_types::star_system;

use frontier_types::position::Position;
use std::string::String;
use sui::vec_map::{Self, VecMap};

public struct StarSystem has store {
    id: u32,
    name: String,
    constellation_id: u32,
    region_id: u32,
    center: Position,
    properties: VecMap<String, vector<u8>>,
}

public fun define(
    id: u32,
    name: String,
    constellation_id: u32,
    region_id: u32,
    center: Position,
    properties: VecMap<String, vector<u8>>,
): StarSystem {
    StarSystem {
        id,
        name,
        constellation_id,
        region_id,
        center,
        properties,
    }
}

public fun destroy(solar_system: StarSystem) {
    let StarSystem {
        id: _,
        name: _,
        constellation_id: _,
        region_id: _,
        center,
        properties: _,
    } = solar_system;

    center.destroy();
}

// Getters
public fun id(solar_system: &StarSystem): u32 {
    solar_system.id
}

public fun name(solar_system: &StarSystem): String {
    solar_system.name
}

public fun constellation_id(solar_system: &StarSystem): u32 {
    solar_system.constellation_id
}

public fun region_id(solar_system: &StarSystem): u32 {
    solar_system.region_id
}

public fun center(solar_system: &StarSystem): &Position {
    &solar_system.center
}

public fun center_mut(solar_system: &mut StarSystem): &mut Position {
    &mut solar_system.center
}

public fun property(solar_system: &StarSystem, key: &String): &vector<u8> {
    solar_system.properties.get(key)
}

public fun property_mut(solar_system: &mut StarSystem, key: &String): &mut vector<u8> {
    solar_system.properties.get_mut(key)
}

// Setters
public fun set_name(solar_system: &mut StarSystem, value: String) {
    solar_system.name = value;
}

public fun set_constellation_id(solar_system: &mut StarSystem, value: u32) {
    solar_system.constellation_id = value
}

public fun set_region_id(solar_system: &mut StarSystem, value: u32) {
    solar_system.region_id = value
}

public fun set_center(solar_system: &mut StarSystem, value: &Position) {
    let position = solar_system.center_mut();
    position.set_x(value.x());
    position.set_y(value.y());
    position.set_z(value.z());
}

public fun set_property(solar_system: &mut StarSystem, key: String, value: vector<u8>) {
    if (solar_system.properties.contains(&key)) {
        solar_system.properties.remove(&key);
    };

    solar_system.properties.insert(key, value);
}
