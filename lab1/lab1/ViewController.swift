//
//  ViewController.swift
//  lab1
//
//  Created by Pujan Tandukar on 9/5/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var centerText: UILabel!
    @IBOutlet weak var iFact: UILabel!
    @IBOutlet weak var gwB: UIButton!
    @IBOutlet weak var ctrB: UIButton!
    @IBOutlet weak var mpB: UIButton!
    @IBOutlet weak var ciB: UIButton!
    @IBOutlet weak var pB: UIButton!
    @IBOutlet weak var tmB: UIButton!
    @IBOutlet weak var cB: UIButton!
    
    
    @IBAction func chooseWonder(_ sender: UIButton) {
        if sender.tag == 0 {
            
            gwB.tintColor = UIColor.red
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "china")
            centerText.text = "The Great Wall of China"
            iFact.text = "The Great Wall is actually a succession of multiple walls spanning approximately 4,000 miles, making it the world's longest manmade structure."
        }
        else if sender.tag == 1 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.red
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "brazil")
            centerText.text = "Christ the Redeemer"
            iFact.text = "The 130-foot reinforced concrete-and-soapstone statue was designed by Heitor da Silva Costa and cost approximately $250,000 to build - much of the money was raised through donations."
        }
        else if sender.tag == 2 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.red
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "peru")
            centerText.text = "Machu Picchu"
            iFact.text = "The site can only be reached by foot, train or helicopter; most visitors visit by train from nearby Cusco."
        }
        else if sender.tag == 3 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.red
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "mexico")
            centerText.text = "Chichen Itza"
            iFact.text = "The most familiar ruin at the site is El Caracol, a sophisticated astronomical observatory."
            
        }
        else if sender.tag == 4 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.red
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "jordan")
            centerText.text = "Petra"
            iFact.text = "Declared a World Heritage Site in 1985, Petra was the capital of the Nabataean empire of King Aretas IV, and likely existed in its prime from 9 B.C. to A.D. 40."
        }
        else if sender.tag == 5 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.red
            cB.tintColor = UIColor.blue
            
            centerImage.image = UIImage(named: "india")
            centerText.text = "Taj Mahal"
            iFact.text = "A mausoleum commissioned for the wife of Mughal Emperor Shah Jahan, the Taj Majal was built between 1632 and 1648."
        }
        else if sender.tag == 6 {
            
            gwB.tintColor = UIColor.blue
            ctrB.tintColor = UIColor.blue
            mpB.tintColor = UIColor.blue
            ciB.tintColor = UIColor.blue
            pB.tintColor = UIColor.blue
            tmB.tintColor = UIColor.blue
            cB.tintColor = UIColor.red
            
            centerImage.image = UIImage(named: "rome")
            centerText.text = "The Colosseum"
            iFact.text = "The elliptical structure sat nearly 50,000 spectators, who gathered to watch the gladiatorial events as well as other public spectacles, including battle reenactments, animal hunts and executions."
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isUserInteractionEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

