//
//  Pokemon.swift
//  Pokidex
//
//  Created by Joel Poe on 4/1/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _weight: String!
    private var _attack: String!
    private var _height: String!
    private var _nextEvolution: String!
    private var _nextEvolutionID: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonURL: String!
    
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var pokedexID: Int {
        if _pokedexID == nil {
            _pokedexID = 0
        }
        return _pokedexID
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    
    var nextEvolutionID: String {
        if _nextEvolutionID == nil {
            _nextEvolutionID = ""
        }
        return _nextEvolutionID
    }
    
    var nextEvolutionLvl: String {
        if _nextEvolutionLvl == nil {
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
    init(name: String, pokedexID: Int) {
        
        self._name = name
        self._pokedexID = pokedexID
        
        _pokemonURL = "\(mainURL)\(pokeURL)\(self._pokedexID)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let  result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    if types.count > 1 {
                        for x in 1...types.count-1 {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                    
                } else {
                    self._type = "N/A"
                }
                
                if let descriptionArr = dict["descriptions"] as? [Dictionary<String,String>] where descriptionArr.count > 0 {
                    
                    if let loc = descriptionArr[0]["resource_uri"] {
                        
                        let nsurl = NSURL(string: "\(mainURL)\(loc)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            
                            let descResult = response.result
                            
                            if let descripDic = descResult.value as? Dictionary<String, AnyObject> {
                                
                                if let  desc = descripDic["description"] as? String {
                                    self._description = desc
                                }
                            }
                            completed()
                        }
                    }
                } else {
                    self._description = ""
                }
                
                if let evolution = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolution.count > 0 {
                    
                    if let evo = evolution[0]["to"] as? String {
                        
                        if let string = evolution[0]["resource_uri"] {
                            let newString = string.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                            let evoPID = newString.stringByReplacingOccurrencesOfString("/", withString: "")
                            
                            self._nextEvolutionID = evoPID
                            
                        }
                        self._nextEvolution = evo
                        if let lvl = evolution[0]["level"] as? Int {
                            self._nextEvolutionLvl = "\(lvl)"
                        }
                
                    } else {
                        self._nextEvolutionLvl = "None"
                    }
                } else {
                    self._nextEvolution = "No Evolutions Available"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = String(defense)
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = String(attack)
                }
                
            }
            
        }
        
    }
    
}