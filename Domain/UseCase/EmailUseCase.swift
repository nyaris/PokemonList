//
//  AccessUseCase.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 13/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift

public class EmailUseCase {
    let cacheRepo:CacheRepository
    let pokeRepo:PokemonRepository
 
    
    
    
    init (cacheRepository:CacheRepository, pokemonRepository: PokemonRepository) {
        self.cacheRepo = cacheRepository
        self.pokeRepo = pokemonRepository
        
        
    }
    public func email(key: String) -> String {
        let user: UserResponse? = cacheRepo.retrieve(fromKey: key)
        return user!.email
        
        
    }
    
    public func listPokemon() -> Single<[PokemonResponse]> {
        return pokeRepo.getPokemon()
    }
    

}


