//
//  PokeCell.swift
//  Pokidex
//
//  Created by Joel Poe on 4/1/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 10.0
    }
    
    func configuredCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLabel.text = pokemon.name
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
        
    }
    
}
