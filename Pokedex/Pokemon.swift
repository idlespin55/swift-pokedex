//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 5/9/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    //**********CLASS VARIABLES**********
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedex: Int {
        return _pokedexID
    }
    
    //**********INITIALIZER**********
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexID)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value.debugDescription)
        }
    }
}