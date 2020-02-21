//
//  PokemonAPIResponse.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 13/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

struct PokemonAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonAPIModel]
}

struct PokemonAPIModel: Codable {
    let name: String
    let url: String
}

extension PokemonAPIResponse {
    func map() -> [PokemonResponse] {
        var list: [PokemonResponse] = []
        self.results.forEach { (PokemonModel) in
            list.append(PokemonResponse(name: PokemonModel.name, url: PokemonModel.url))
        }
        return list
    }
}
