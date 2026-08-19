module frontier_types::tribe;

use std::string::String;

public struct Tribe has store {
    id: u32,
    name: String,
    ticker: String,
    description: String,
    url: String,
}

public fun define(id: u32, name: String, ticker: String, description: String, url: String): Tribe {
    Tribe {
        id,
        name,
        ticker,
        description,
        url,
    }
}

public fun clone(tribe: &Tribe): Tribe {
    Tribe {
        id: tribe.id,
        name: tribe.name,
        ticker: tribe.ticker,
        description: tribe.description,
        url: tribe.url,
    }
}

public fun destroy(tribe: Tribe) {
    let Tribe {
        id: _,
        name: _,
        ticker: _,
        description: _,
        url: _,
    } = tribe;
}

// Getters
public fun id(tribe: &Tribe): u32 {
    tribe.id
}

public fun name(tribe: &Tribe): String {
    tribe.name
}

public fun ticker(tribe: &Tribe): String {
    tribe.ticker
}

public fun description(tribe: &Tribe): String {
    tribe.description
}

public fun url(tribe: &Tribe): String {
    tribe.url
}

// Setters
public fun set_name(tribe: &mut Tribe, value: String) {
    tribe.name = value;
}

public fun set_ticker(tribe: &mut Tribe, value: String) {
    tribe.ticker = value;
}

public fun set_description(tribe: &mut Tribe, value: String) {
    tribe.description = value;
}

public fun set_url(tribe: &mut Tribe, value: String) {
    tribe.url = value;
}
