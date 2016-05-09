//
//  Pokeman.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 4/29/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import Foundation

class Pokeman {
    
    //**********CLASS VARIABLES**********
    private var _name: String!
    private var _pokedexID: Int!

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
    }
}