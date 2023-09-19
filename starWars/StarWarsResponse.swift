//
//  StarWarsResponse.swift
//  starWars
//
//  Created by Aizada on 30.08.2023.
//

import Foundation

struct StarWarsResponse: Decodable {
    let results: [StarWars]
}
