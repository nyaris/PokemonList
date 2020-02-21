//
//  DetailsViewController.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 14/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var namePoke: UILabel!
    @IBOutlet weak var pokeHeight: UILabel!
    @IBOutlet weak var pokeWeight: UILabel!
    @IBOutlet weak var viewPoke: UIView!
    
    private let disposeBag = DisposeBag()
    var viewModel: PokemonDetailsViewModelContract!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPoke.layer.cornerRadius = 100
        viewModel.getDetailsPokemon()
        setup()
    }
    
    static func instantiate(viewModel: PokemonDetailsViewModelContract) -> DetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        view.viewModel = viewModel
        return view
    }
    

    
    func setup() {
        viewModel.pokeDetails.drive(onNext: { (response) in
            guard let response = response else { return }
            self.namePoke.text = response.name
            
            let height = "Altura: \(response.height)"
            self.pokeHeight.text = String(height)
            
            let weight = "Peso: \(response.weight)"
            self.pokeWeight.text = String(weight)
            
            
        }).disposed(by: disposeBag)
          
        viewModel.pokeImage.drive(imageView.rx.image).disposed(by: disposeBag)
    }
       
    
    
}
