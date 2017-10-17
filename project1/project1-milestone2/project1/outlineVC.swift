//
//  outlineVC.swift
//  project1
//
//  Created by Pujan Tandukar on 10/4/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class outlineVC: UIViewController {
    
    @IBOutlet weak var buttonMain: UIButton!
    
    @IBAction func redSlider(_ sender: UISlider) {
        let redS = sender.value
        let redCG = CGFloat(redS)
        buttonMain.backgroundColor = UIColor(red: redCG, green: 0, blue: 0, alpha: 255)
    }
    
    @IBAction func greenS(_ sender: UISlider) {
        let greenS = sender.value
        let greenCG = CGFloat(greenS)
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        let blueS = sender.value
        let blueCG = CGFloat(blueS)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
