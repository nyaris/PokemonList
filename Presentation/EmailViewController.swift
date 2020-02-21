//
//  EmailViewController.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 12/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EmailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelEmail: UILabel!
    
    var viewModel:EmailViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelEmail.text = viewModel.email
        viewModel.getPokemon()
        
       
        labelEmail.layer.cornerRadius = 30
           
        labelEmail.layer.masksToBounds = true
    
        bind()
        
    }
    
   
    
    static func instantiate(viewModel: EmailViewModel) -> EmailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "EmailViewController") as! EmailViewController
        view.viewModel = viewModel
        return view
    }
    
    
    @IBAction func sair(_ sender: Any) {
        
      self.dismiss(animated: true, completion: nil)
        
    }
    
    private func bind() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel.pokeList.map{ $0 ?? [] }.drive(tableView.rx.items(cellIdentifier: "cell")) { index, model, cell in
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.bind { selectedIndex in
            guard let selectedPokemon = self.viewModel.getPokemon(at: selectedIndex.row) else { return }
            let viewController = self.makeDetailsViewController(selectedPokemon: selectedPokemon)
            self.present(viewController, animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }
    
    func makeDetailsViewController(selectedPokemon: PokemonResponse) -> UIViewController {
        let repo = PokemonRepositoryImpl()
        let useCase = PokemonDetailsUseCase(pokemonDetailsRepository: repo)
        let viewModel = PokemonDetailsViewModel(pokemonUseCase: useCase, pokeAPI: selectedPokemon)
        return DetailsViewController.instantiate(viewModel: viewModel)
    }
    
}
