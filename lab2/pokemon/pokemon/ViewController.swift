//
//  ViewController.swift
//  pokemon
//
//  Created by Pujan Tandukar on 9/14/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved. For Educational Purposes Only
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    
    @IBOutlet weak var pokeControl: UISegmentedControl!
    @IBAction func pokeChange(_ sender: UISegmentedControl) {
        if pokeControl.selectedSegmentIndex == 0 {
            pokeName.text = "Charmander"
            pokeImage.image = UIImage(named: "charmander")
            buttonStage.isOn = false;
            pokeName.textColor = UIColor.red
        }
        if pokeControl.selectedSegmentIndex == 1 {
            pokeName.text = "Squirtle"
            pokeImage.image = UIImage(named: "squirtle")
            buttonStage.isOn = false;
            pokeName.textColor = UIColor.blue
        }
        if pokeControl.selectedSegmentIndex == 2 {
            pokeName.text = "Bulbasaur"
            pokeImage.image = UIImage(named: "bulbasaur")
            buttonStage.isOn = false;
            pokeName.textColor = UIColor.green
        }
        
    }

    @IBOutlet weak var buttonStage: UISwitch!
    
    @IBAction func evolutionButton(_ sender: Any) {
        if pokeControl.selectedSegmentIndex == 0 && buttonStage.isOn == true{
            pokeName.text = "Charmeleon"
            pokeImage.image = UIImage(named: "charmeleon")
            pokeName.text = pokeName.text?.uppercased()

        }
        if pokeControl.selectedSegmentIndex == 0 && buttonStage.isOn == false{
            pokeName.text = "Charmander"
            pokeImage.image = UIImage(named: "charmander")
        }
        if pokeControl.selectedSegmentIndex == 1 && buttonStage.isOn == true{
            pokeName.text = "Wartotle"
            pokeImage.image = UIImage(named: "wartotle")
            pokeName.text = pokeName.text?.uppercased()
        }
        if pokeControl.selectedSegmentIndex == 1 && buttonStage.isOn == false{
            pokeName.text = "Squirtle"
            pokeImage.image = UIImage(named: "squirtle")
        }
        if pokeControl.selectedSegmentIndex == 2 && buttonStage.isOn == true{
            pokeName.text = "Ivasaur"
            pokeImage.image = UIImage(named: "ivasaur")
            pokeName.text = pokeName.text?.uppercased()
        }
        if pokeControl.selectedSegmentIndex == 2 && buttonStage.isOn == false{
            pokeName.text = "Bulbasaur"
            pokeImage.image = UIImage(named: "bulbasaur")
        }
    }
    
    
    @IBAction func pokeSlider(_ sender: UISlider) {
        let fontSize = sender.value
        let fontSizeCGFloat = CGFloat(fontSize)
        pokeName.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
}

