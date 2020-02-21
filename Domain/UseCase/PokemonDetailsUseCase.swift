//
//  PokemonDetailsUseCase.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 17/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift

public class PokemonDetailsUseCase {

let pokeDetailsRepo: PokemonRepository
    
    init (pokemonDetailsRepository: PokemonRepository ) {
         self.pokeDetailsRepo = pokemonDetailsRepository
         
     }

    public func detailsPokemon(url: String) -> Single<PokemonDetailsResponse> {
        let convertedUrl = URL(string: url) ?? URL(string: "")!
        return pokeDetailsRepo.goDetailsPokemon(url: convertedUrl)
    }
    
    func getPokemonImage(url: URL) ->  Single<UIImage?>{
        return pokeDetailsRepo.getPokemonImage(url: url)

    }
}
