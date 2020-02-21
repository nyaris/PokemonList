//
//  PokemonDetailsService.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 14/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

class PokemonDetailsService: MoyaService {
    let pokemonUrl: URL
    
    override var baseURL: URL {
        return pokemonUrl
    }
    
    init(pokemonUrl: URL) {
        self.pokemonUrl = pokemonUrl
    }
}
