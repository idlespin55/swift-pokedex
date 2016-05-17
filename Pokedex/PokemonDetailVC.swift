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
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    var poke: Pokemon!
    
    
    //**********IBActions**********
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //**********ViewDidLoad()**********
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = poke.name
        mainImg.image = UIImage(named: "\(poke.pokedex)")
        poke.downloadPokemonDetails { () -> () in
            //This code will be called after download is completed
        }
    }
}