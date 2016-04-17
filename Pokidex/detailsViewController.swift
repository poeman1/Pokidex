//
//  detailsViewController.swift
//  Pokidex
//
//  Created by Joel Poe on 4/12/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit
import Alamofire

class detailsViewController: UIViewController {
    
    var pokemon: Pokemon! 

    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var evoImage1: UIImageView!
    @IBOutlet weak var evoImage2: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeNameLabel.text = pokemon.name.capitalizedString
        mainImage.image = UIImage(named: "\(pokemon.pokedexID)")
        
        pokemon.downloadPokemonDetails { () -> () in
            
            self.updateUI()
            
        }
        
    }
    
    func updateUI() {
        
        descriptLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        
        
        evolutionLabel.text = "Next Evolution: \(pokemon.nextEvolution)"
        idLabel.text = "\(pokemon.pokedexID)"
        evoImage1.image = UIImage(named: "\(pokemon.pokedexID)")
        
        if pokemon.nextEvolutionID == "None" {
            evoImage2.hidden = true
        } else {
            evoImage2.hidden = false
            evoImage2.image = UIImage(named: "\(pokemon.nextEvolutionID)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
