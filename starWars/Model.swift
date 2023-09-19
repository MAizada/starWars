//
//  Model.swift
//  starWars
//
//  Created by Aizada on 28.08.2023.
//

import Foundation

struct StarWarsResponse: Decodable {
    let results: [People]
}
struct PlanetResponse: Decodable {
    let results: [Planet]
}

struct StarWarsItem {
    let character: People?
    let planet: Planet?
}

struct People: Decodable {
    let name: String
    let gender: String
    let mass: String
}

struct Planet: Decodable {
    let name: String
    let population: String
    let diameter: String
}

enum ReguestType {
    case people
    case planet
}
