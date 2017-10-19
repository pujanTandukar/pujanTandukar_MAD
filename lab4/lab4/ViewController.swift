//
//  ViewController.swift
//  lab4
//
//  Created by Pujan Tandukar on 10/10/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var kval: UILabel!
    @IBOutlet weak var kvalG: UILabel!
    @IBOutlet weak var kvalBlue: UILabel!
    var labelR:Int = 0
    var labelG:Int = 0
    var labelB:Int = 0
    
    var user = values()
    let filename = "colors.plist"
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        print(dir.appendingPathComponent(filename))
        return dir.appendingPathComponent(filename)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
        //pulling data from sliders
        kval.text = user.vRed
        kvalG.text = user.vGreen
        kvalBlue.text = user.vBlue
//        Int(kval.text!) = user.v2Red
//        Int(kvalG.text!) = user.v2Green
//        Int(kvalB.text!) = user.v2Blue
        
        
        //converting the data to CGFloat to change backgroundColor
        let labelRed = CGFloat(Float(kval.text!)!/255)
        let labelGreen = CGFloat(Float(kvalG.text!)!/255)
        let labelBlue = CGFloat(Float(kvalBlue.text!)!/255)
        mainButton.backgroundColor = UIColor(red: labelRed, green: labelGreen, blue: labelBlue, alpha: 1.0)
        labelR = Int(kval.text!)!
        labelG = Int(kvalG.text!)!
        labelB = Int(kvalBlue.text!)!
        
        //converting to hex
        let intRed = deci2Hex(num:Int(kval.text!)!)
        let intGreen = deci2Hex(num:Int(kvalG.text!)!)
        let intBlue = deci2Hex(num:Int(kvalBlue.text!)!)
        mainButton.setTitle("#" + intRed + intGreen + intBlue, for: UIControlState.normal)
        
        //checking if two of the three values are greater than 0.6
        if(checkStrength(a: labelRed,b: labelGreen,c: labelBlue) == true){
            mainButton.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            mainButton.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1.0, alpha: 255), for: .normal)
        }
        
    }
    
    //takes in 3 CGFloats and checks if atleast two pf them are greater than 0.6
    func checkStrength(a:CGFloat,b:CGFloat,c:CGFloat) -> Bool{
        if((a>=0.7 && b>=0.7) || (a>=0.7 && c>=0.7) || (b>=0.7 && c>=0.7)){
            return true
        }
        else{
            return false
        }
    }
    
    //converting the RGB value from integer to a hex string
    func deci2Hex(num:Int) -> String{
        var var1 = String(Int(num/16))
        var var2 = String(Int(num%16))
        //var 1
        if var1 == "10" {
            var1 = "A"
        }
        if var1 == "11" {
            var1 = "B"
        }
        if var1 == "12" {
            var1 = "C"
        }
        if var1 == "13" {
            var1 = "D"
        }
        if var1 == "14" {
            var1 = "E"
        }
        if var1 == "15" {
            var1 = "F"
        }
        //var2
        if var2 == "10" {
            var2 = "A"
        }
        if var2 == "11" {
            var2 = "B"
        }
        if var2 == "12" {
            var2 = "C"
        }
        if var2 == "13" {
            var2 = "D"
        }
        if var2 == "14" {
            var2 = "E"
        }
        if var2 == "15" {
            var2 = "F"
        }
        let var3 = String(var1+var2)
        return var3!;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondScreen"{
            let scene1ViewController = segue.destination as! secondViewController

                scene1ViewController.user1.v2Red = labelR

                scene1ViewController.user1.v2Green = labelG

                scene1ViewController.user1.v2Blue = labelB
        }}
    
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            //load the data of the plist file into a dictionary
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            //load red
            if dataDictionary.keys.contains("red") {
                user.vRed = dataDictionary["red"]
                kval.text = user.vRed
                    
            }
            //load green
            if dataDictionary.keys.contains("green") {
                user.vGreen = dataDictionary["green"]
                kvalG.text = user.vGreen
            }
            //load blue
            if dataDictionary.keys.contains("blue") {
                user.vBlue = dataDictionary["blue"]
                kvalBlue.text = user.vBlue
            }
        }
        
        let labelRed = CGFloat(Float(kval.text!)!/255)
        let labelGreen = CGFloat(Float(kvalG.text!)!/255)
        let labelBlue = CGFloat(Float(kvalBlue.text!)!/255)
        mainButton.backgroundColor = UIColor(red: labelRed, green: labelGreen, blue: labelBlue, alpha: 1.0)
        labelR = Int(kval.text!)!
        labelG = Int(kvalG.text!)!
        labelB = Int(kvalBlue.text!)!
        
        //converting to hex
        let intRed = deci2Hex(num:Int(kval.text!)!)
        let intGreen = deci2Hex(num:Int(kvalG.text!)!)
        let intBlue = deci2Hex(num:Int(kvalBlue.text!)!)
        mainButton.setTitle("#" + intRed + intGreen + intBlue, for: UIControlState.normal)

        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds
        if user.vRed != nil{
            data.setValue(user.vRed, forKey: "red")
            
        }
        if user.vGreen != nil{
            data.setValue(user.vGreen, forKey: "green")
        }
        if user.vBlue != nil{
            data.setValue(user.vBlue, forKey: "blue")
        }
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

