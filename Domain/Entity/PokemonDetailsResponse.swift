//
//  PokemonDetailsResponse.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 14/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

public struct PokemonDetailsResponse: Codable {
    let name: String
    let height: Int
    let weight: Int
    let urlImage: String
}
