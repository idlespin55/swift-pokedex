//
//  PokeCell.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 5/7/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    //**********IBOutlets**********
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    var pokemon: Pokemon!
    
   
    //**********INITIALIZER**********
    //We implement this so that we can change the cornerRadius
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 10.0
    }
    
    
    //**********CONFIGURECELL()**********
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
}