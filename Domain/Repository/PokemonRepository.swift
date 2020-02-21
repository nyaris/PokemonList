//
//  PokemonRepository.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 17/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import RxSwift

protocol PokemonRepository {
    func getPokemon() -> Single<[PokemonResponse]>
    func goDetailsPokemon(url: URL) -> Single<PokemonDetailsResponse>
    func getPokemonImage(url: URL) -> Single<UIImage?>
}
