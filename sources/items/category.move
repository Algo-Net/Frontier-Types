module frontier_types::category;

use std::string::String;

public struct Category has store {
    id: u32,
    name: String,
    icon_id: u32,
}

public fun define(id: u32, name: String, icon_id: u32): Category {
    Category {
        id,
        name,
        icon_id,
    }
}

public fun clone(category: &Category): Category {
    Category {
        id: category.id,
        name: category.name,
        icon_id: category.icon_id,
    }
}

public fun destroy(category: Category) {
    let Category {
        id: _,
        name: _,
        icon_id: _,
    } = category;
}

// Getters
public fun id(category: &Category): u32 {
    category.id
}

public fun name(category: &Category): String {
    category.name
}

public fun icon_id(category: &Category): u32 {
    category.icon_id
}

// Setters
public fun set_name(category: &mut Category, value: String) {
    category.name = value;
}

public fun set_icon_id(category: &mut Category, value: u32) {
    category.icon_id = value;
}
