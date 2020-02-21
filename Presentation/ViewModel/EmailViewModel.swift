//
//  EmailViewModel.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 13/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol EmailViewModelContract {
    var email: String { get }
    func getPokemon()
    func getPokemon(at index: Int) -> PokemonResponse?
}

public class EmailViewModel: EmailViewModelContract {
    
    private let pokeListRelay:BehaviorRelay<[PokemonResponse]?> = BehaviorRelay(value: nil)
    
    public var pokeList: Driver<[PokemonResponse]?> { return pokeListRelay.asDriver() }
    
    let disposeBag = DisposeBag()
    
    public func getPokemon() {
        usecase.listPokemon().subscribe(onSuccess: { pokemons in
            self.pokeListRelay.accept(pokemons)
            }).disposed(by: disposeBag)
    }
    
    public func getPokemon(at index: Int) -> PokemonResponse? {
        return pokeListRelay.value?[index]
    }
    
    public var email: String
    var usecase: EmailUseCase
    
    init(usecase: EmailUseCase) {
        self.usecase = usecase
        self.email = usecase.email(key: "user_key")
    }
    
    
}
