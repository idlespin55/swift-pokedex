//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 5/9/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    //**********IBOutlets & VARIABLES**********
    var poke: Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    
    //**********ViewDidLoad()**********
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = poke.name
    }
}