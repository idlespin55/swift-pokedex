//
//  ViewController.swift
//  Pokedex
//
//  Created by Ajmal Ahmady on 4/29/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//  UTILIZES COLLECTIONVIEWS
//  TO USE NEW FONTS, DOWNLOAD, ADD TO PROJECT, & ADD NAME TO INFO.PLIST

import UIKit
import AVFoundation         //To play music

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    //CollectionViews need to implement three protocols: CVDataSource, CVDelegate, & CVDelegateFlowLayout
    //SearchBar needs to implement one protocol: UISearchBarDelegate
    //In cellForItemAtIndexPath(), we create a new pokeman instance and configure the cell
    //In the storyboard, connect the VC to the detailVC (i.e. not from the cell), as we manually call performSegueWithIdentifier
    
    //**********IBOUTLETS & VARIABLES**********
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var poke: Pokemon!
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    var filteredPokemon = [Pokemon]()
    
    
    
    //**********IBACTIONS**********
    @IBAction func musicBtnPressed(sender: UIButton!) {
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    
    //**********ViewDidLoad() IMPLEMENTATION**********
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done          //Changes 'Search' button to 'Done'
        parsePokemonCSV()
        initAudio()
    }
    
    
    //**********SUPPORTING FUNCTIONS**********
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexID: pokeId)
                pokemon.append(poke)
            }
        }   catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initAudio() {
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        let pathURL = NSURL(string: path)
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: pathURL!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1      //Infinite loop
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    //**********UICollectionView PROTOCOL IMPLEMENTATION**********
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        } else {
            return pokemon.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            } else {
                poke = pokemon[indexPath.row]
            }
            cell.configureCell(poke)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemon[indexPath.row]
        }
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Ensure we have the right segue, cast the destinationVC as a PokemonDetailVC,
        //cast the sender (poke from cellForItemAtIndexPath), then send it to detailsVC
        if segue.identifier == "PokemonDetailVC" {
            if let detailsVC = segue.destinationViewController as? PokemonDetailVC {
                if let poke = sender as? Pokemon {
                    detailsVC.poke = poke
                }
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)   //Returns the size of each cell
    }
    
    
    //**********UISearchBarDelegate PROTOCOL IMPLEMENTATION**********
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //This will filter our pokemon array with the search bar text.  If it is not nil, it will add it to our filtered array
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false            //Turn off search mode
            view.endEditing(true)           //Close the keyboard
            collection.reloadData()         //Reload the data
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()      //Will refresh UICollectionView
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)               //Closes the keyboard when search button on keyboard is clicked
    }
}