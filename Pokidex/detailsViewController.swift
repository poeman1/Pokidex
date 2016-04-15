//
//  detailsViewController.swift
//  Pokidex
//
//  Created by Joel Poe on 4/12/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    
    var pokemon: Pokemon! 

    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var evoImage1: UIImageView!
    @IBOutlet weak var evoImage2: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeNameLabel.text = pokemon.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
