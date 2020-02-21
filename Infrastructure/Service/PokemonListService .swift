//
//  PokemonListService .swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 17/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

class PokemonListService: MoyaService {
    override var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    override var path: String {
        return "pokemon"
    }
}

