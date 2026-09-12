module frontier_types::group;

use std::string::String;

public struct Group has store {
    id: u32,
    name: String,
    parent_id: u32,
    icon_id: u32,
}

public fun define(id: u32, name: String, parent_id: u32, icon_id: u32): Group {
    Group {
        id,
        name,
        parent_id,
        icon_id,
    }
}

public fun clone(group: &Group): Group {
    Group {
        id: group.id,
        name: group.name,
        parent_id: group.parent_id,
        icon_id: group.icon_id,
    }
}

public fun destroy(group: Group) {
    let Group {
        id: _,
        name: _,
        parent_id: _,
        icon_id: _,
    } = group;
}

// Getters
public fun id(group: &Group): u32 {
    group.id
}

public fun name(group: &Group): String {
    group.name
}

public fun parent_id(group: &Group): u32 {
    group.parent_id
}

public fun icon_id(group: &Group): u32 {
    group.icon_id
}

// Setters
public fun set_name(group: &mut Group, value: String) {
    group.name = value;
}

public fun set_parent_id(group: &mut Group, value: u32) {
    group.parent_id = value;
}

public fun set_icon_id(group: &mut Group, value: u32) {
    group.icon_id = value;
}
