//
//  ViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 9/25/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBAction func generateButton(_ sender: Any) {
        var arrayOfColors = [Int]()
        var arrayofColors2 = [CGFloat]()
        var randomColor = 1;
        for j in 0 ... 15 {
            for i in 0 ... 15{
                randomColor = Int(arc4random_uniform(255))
                randomColor /= 255
                arrayOfColors.append(i)
            }
            arrayofColors2.append(CGFloat(j))
        }
//        let randomColor1 = Int(arc4random_uniform(255))
//        for p in 0 ... array1.count{
//            array1[p] = arrayofColors2[p]
//        }
        var a:CGFloat = arrayofColors2[0]
        var b:CGFloat = arrayofColors2[1]
        var c:CGFloat = arrayofColors2[2]
        
        
        button1.backgroundColor = UIColor(red: a/255, green: b/255, blue: c/255, alpha: 220)
        button2.backgroundColor = UIColor(red: 130/255, green: 190/255, blue: 190/255, alpha: 220)
        button3.backgroundColor = UIColor(red: 190/255, green: 100/255, blue: 20/255, alpha: 220)
        button4.backgroundColor = UIColor(red: 10/255, green: 220/255, blue: 190/255, alpha: 220)
        button5.backgroundColor = UIColor(red: 20/255, green: 130/255, blue: 20/255, alpha: 220)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

