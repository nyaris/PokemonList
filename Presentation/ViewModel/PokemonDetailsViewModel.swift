//
//  PokemonDetailsViewModel.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 17/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol PokemonDetailsViewModelContract {
    func getDetailsPokemon()
    var pokeDetails: Driver<PokemonDetailsResponse?> { get }
    var pokeImage: Driver<UIImage?> { get }
}

public class PokemonDetailsViewModel: PokemonDetailsViewModelContract {

    private let pokeDetailsRelay:BehaviorRelay<PokemonDetailsResponse?> = BehaviorRelay(value: nil)
    private let pokeImageRelay:BehaviorRelay<UIImage?> = BehaviorRelay(value: nil)
    
    public var pokeDetails: Driver<PokemonDetailsResponse?> { return pokeDetailsRelay.asDriver() }
    public var pokeImage: Driver<UIImage?> { return pokeImageRelay.asDriver() }

    var pokeAPI: PokemonResponse
    let pokemonUseCase: PokemonDetailsUseCase
    let disposeBag = DisposeBag()
    
    init(pokemonUseCase: PokemonDetailsUseCase, pokeAPI: PokemonResponse) {
        self.pokeAPI = pokeAPI
        self.pokemonUseCase = pokemonUseCase
    }
    
    public func getDetailsPokemon() {
        pokemonUseCase.detailsPokemon(url: pokeAPI.url).subscribe(onSuccess: { pokemon in
            self.pokeDetailsRelay.accept(pokemon)
            self.pokemonUseCase.getPokemonImage(url: URL(string: pokemon.urlImage)!).subscribe(onSuccess: { (image) in
                self.pokeImageRelay.accept(image)
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
}
