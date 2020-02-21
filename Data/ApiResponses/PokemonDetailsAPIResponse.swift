//
//  PokemonDetailsAPIResponse.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 14/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

struct PokemonDetailsAPIResponse: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    
}

struct Sprites: Codable {
    let frontDefault: String
}
extension PokemonDetailsAPIResponse {
    func map() -> PokemonDetailsResponse {
        let pokemon = PokemonDetailsResponse(name: self.name, height: self.height, weight: self.weight, urlImage: self.sprites.frontDefault)

//        var list: [PokemonDetailsResponse] = []
//        self.sprites.forEach { (PokemonModel) in
//            list.append(PokemonDetailsResponse(id: PokemonModel.name, url: PokemonModel.url ))
//        }
        
        return pokemon
    }
}


    
  
  

