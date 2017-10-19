//
//  secondViewController.swift
//  lab4
//
//  Created by Pujan Tandukar on 10/10/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var user1  = values2()
    
    @IBOutlet weak var redS: UISlider!
    @IBOutlet weak var greenS: UISlider!
    @IBOutlet weak var blueS: UISlider!
    
    @IBAction func redSlider(_ sender: UISlider) {
        let redC = Int(sender.value)
        let redStr = String(redC)
        redLabel.text = redStr
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        let greenC = Int(sender.value)
        let greenStr = String(greenC)
        greenLabel.text = greenStr
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        let blueC = Int(sender.value)
        let blueStr = String(blueC)
        blueLabel.text = blueStr
    }
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToMain"{
            let scene1ViewController = segue.destination as! ViewController
            if redLabel.text!.isEmpty == false {
                scene1ViewController.user.vRed = self.redLabel.text
            }
            
            if greenLabel.text!.isEmpty == false {
                scene1ViewController.user.vGreen = self.greenLabel.text
            }
            
            if blueLabel.text!.isEmpty == false {
                scene1ViewController.user.vBlue = self.blueLabel.text
            }
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redS.value = Float(user1.v2Red!)
        greenS.value = Float(user1.v2Green!)
        blueS.value = Float(user1.v2Blue!)
        redLabel.text = String(user1.v2Red!)
        greenLabel.text = String(user1.v2Green!)
        blueLabel.text = String(user1.v2Blue!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
