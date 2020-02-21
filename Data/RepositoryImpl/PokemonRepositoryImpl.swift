//
//  PokemonRepositoryImpl.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 17/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import RxSwift

public class PokemonRepositoryImpl: PokemonRepository {
    
    func getPokemonImage(url: URL) -> Single<UIImage?> {
        let service = PokemonDetailsService(pokemonUrl: url)
        return service.getDataResponse().map { UIImage(data: $0)! }
    }
    
    
    var pokemonListService = PokemonListService()
    
    func getPokemon() -> Single<[PokemonResponse]> {
        let uncleanPokemon: Single<PokemonAPIResponse> = pokemonListService.getDecodedResponse()
        return uncleanPokemon.map({ pokemon in
            pokemon.map()
        })
        
    }
    
    func goDetailsPokemon(url: URL) -> Single<PokemonDetailsResponse> {
        let service = PokemonDetailsService(pokemonUrl: url)
        let uncleanDetailsPokemon: Single<PokemonDetailsAPIResponse> = service.getDecodedResponse()
        return uncleanDetailsPokemon.map({ pokemon in
            pokemon.map()
        })
    }
}
