//
//  Pokemon.swift
//  Pokidex
//
//  Created by Joel Poe on 4/1/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        
        return _name
        
    }
    
    var pokedexID: Int {
        
        return _pokedexID
        
    }
    
    init(name: String, pokedexID: Int) {
        
        self._name = name
        self._pokedexID = pokedexID
        
    }
    
}