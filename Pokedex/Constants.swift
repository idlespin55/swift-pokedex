//
//  Constants.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 5/12/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import Foundation

//Store constants in a file.  If constants/variables are not in a class, they are globally accessible
let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"

typealias DownloadComplete = () -> ()   //Define closure that accepts no parameters and returns nothing