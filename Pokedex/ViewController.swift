//
//  ViewController.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 4/29/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//  UTILIZES COLLECTIONVIEWS

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //CollectionViews need to implement three protocols: CVDataSource, CVDelegate, & CVDelegateFlowLayout
    //In cellForItemAtIndexPath(), we create a new pokeman instance and configure the cell
    
    //**********IBOUTLETS**********
    @IBOutlet weak var collection: UICollectionView!
    var pokeman = [Pokeman]()
    

    //**********ViewDidLoad() IMPLEMENTATION**********
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        parsePokemonCSV()
    }
    
    
    //**********FUNCTIONS**********
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokeman(name: name, pokedexID: pokeId)
                pokeman.append(poke)
            }
        }   catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    //**********UICollectionView PROTOCOL IMPLEMENTATION**********
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            let poke = pokeman[indexPath.row]
            cell.configureCell(poke)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)   //Returns the size of each cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
}