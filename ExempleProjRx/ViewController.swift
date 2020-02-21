//
//  ViewController.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 12/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var emailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailButton.rx.tap.bind { (_) in
            
            
        }
    }
    
    @IBAction func buttonEmail(_ sender: Any) {
        let repo = CacheRepositoryImpl()
        let pokeRepo = PokemonRepositoryImpl()
        let usecase = EmailUseCase(cacheRepository: repo, pokemonRepository: pokeRepo)
        let vm = EmailViewModel(usecase: usecase)
        let vc = EmailViewController.instantiate(viewModel: vm)
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
}

