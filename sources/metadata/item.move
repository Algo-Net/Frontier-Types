module frontier_types::item;

use std::fixed_point32;
use std::string::String;
use sui::accumulator::Key;
use sui::vec_map::{Self, VecMap};

public struct Item has store {
    id: u32,
    name: String,
    description: String,
    group_id: u32,
    icon_id: u32,
    properties: VecMap<String, vector<u8>>,
}

public fun define(
    id: u32,
    name: String,
    description: String,
    group_id: u32,
    icon_id: u32,
    properties: VecMap<String, vector<u8>>,
): Item {
    Item {
        id,
        name,
        description,
        group_id,
        icon_id,
        properties,
    }
}

public fun destroy(item: Item) {
    let Item {
        id: _,
        name: _,
        description: _,
        group_id: _,
        icon_id: _,
        properties,
    } = item;

    properties.destroy_empty();
}

// Getters
public fun id(item: &Item): u32 {
    item.id
}

public fun name(item: &Item): String {
    item.name
}

public fun description(item: &Item): String {
    item.description
}

public fun group_id(item: &Item): u32 {
    item.group_id
}

public fun icon_id(item: &Item): u32 {
    item.icon_id
}

public fun property(item: &Item, key: &String): &vector<u8> {
    item.properties.get(key)
}

public fun property_mut(item: &mut Item, key: &String): &mut vector<u8> {
    item.properties.get_mut(key)
}

// Setters
public fun set_name(item: &mut Item, value: String) {
    item.name = value;
}

public fun set_description(item: &mut Item, value: String) {
    item.description = value;
}

public fun set_group_id(item: &mut Item, value: u32) {
    item.group_id = value;
}

public fun set_icon_id(item: &mut Item, value: u32) {
    item.icon_id = value;
}

public fun set_property(item: &mut Item, key: String, value: vector<u8>) {
    if (item.properties.contains(&key)) {
        item.properties.remove(&key);
    };

    item.properties.insert(key, value);
}
