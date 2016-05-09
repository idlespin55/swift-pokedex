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
    var pokeman: Pokeman!
    
   
    //**********INITIALIZER**********
    //We implement this so that we can change the cornerRadius
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 10.0
    }
    
    
    //**********CONFIGURECELL()**********
    func configureCell(pokeman: Pokeman) {
        self.pokeman = pokeman
        nameLbl.text = self.pokeman.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokeman.pokedex)")
    }
}