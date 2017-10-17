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
    
    var segueTransfer:[Float] = []
    var segureTransferString:[Int] = []
    
    //button to generate random numbers
    @IBAction func generateButton(_ sender: Any) {
        //creating two arrays : "result" for CGFloats of random number
        // and "resultColors" to store hex values of the particular color
        var result:[CGFloat] = []
        var resultColors:[String] = []
        var segueTransferList:[Float] = []
        var segueTransferInt:[Int] = []
        for _ in 0..<15 {
            let randomNumber = arc4random_uniform(255)
            let floatVal = (CGFloat(randomNumber)/255)
            let fval = Float(randomNumber)/255
            let intVal = Int(randomNumber)
            let colors = deci2Hex(num: intVal)
            segueTransferList.append(fval)
            resultColors.append(colors)
            result.append(floatVal)
            segueTransferInt.append(intVal)
            segueTransfer = segueTransferList
            segureTransferString = segueTransferInt
//            print(result.count)
        }
//        print(segueTransfer)
        let color1 = UIColor(red: result[0], green: result[1], blue: result[2], alpha: 250)
        let color2 = UIColor(red: result[3], green: result[4], blue: result[5], alpha: 250)
        let color3 = UIColor(red: result[6], green: result[7], blue: result[8], alpha: 250)
        let color4 = UIColor(red: result[9], green: result[10], blue: result[11], alpha: 250)
        let color5 = UIColor(red: result[12], green: result[13], blue: result[14], alpha: 250)
        
        //setting the color of each button with the random CGFloat
        button1.backgroundColor = color1
        button2.backgroundColor = color2
        button3.backgroundColor = color3
        button4.backgroundColor = color4
        button5.backgroundColor = color5
        
        //setting the title label to the hex values corelating with the color of the button
        button1.setTitle("#" + resultColors[0] + resultColors[1] + resultColors[2], for: .normal)
        button2.setTitle("#" + resultColors[3] + resultColors[4] + resultColors[5], for: .normal)
        button3.setTitle("#" + resultColors[6] + resultColors[7] + resultColors[8], for: .normal)
        button4.setTitle("#" + resultColors[9] + resultColors[10] + resultColors[11], for: .normal)
        button5.setTitle("#" + resultColors[12] + resultColors[13] + resultColors[14], for: .normal)
        
        //checking if two of the three values are greater than 0.6
        if(checkStrength(a: result[0],b: result[1],c: result[2]) == true){
            button1.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            button1.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1.0, alpha: 255), for: .normal)
        }
        
        if(checkStrength(a: result[3],b: result[4],c: result[5]) == true){
            button2.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            button2.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1.0, alpha: 255), for: .normal)
        }
        
        if(checkStrength(a: result[6],b: result[7],c: result[8]) == true){
            button3.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            button3.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1, alpha: 255), for: .normal)
        }
        
        if(checkStrength(a: result[9],b: result[10],c: result[11]) == true){
            button4.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            button4.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1, alpha: 255), for: .normal)
        }
        
        if(checkStrength(a: result[12],b: result[13],c: result[14]) == true){
            button5.setTitleColor(UIColor(red: 0.0705882353, green: 0.10588235294, blue: 0.10196078431, alpha: 255), for: .normal)
        }
        else{
            button5.setTitleColor(UIColor(red: 0.98039215686, green: 0.98039215686, blue: 1, alpha: 255), for: .normal)
        }
        //animating the button
        animateButton()
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
    
    //Segue to the outline screen
//    @IBAction func button1Press(_ sender: UIButton) {
//        performSegue(withIdentifier: "colorTrigger1", sender:button1)
//    }
//    @IBAction func button2Press(_ sender: UIButton) {
//        performSegue(withIdentifier: "colorTrigger2", sender:button2)
//    }
//    @IBAction func button3Press(_ sender: UIButton) {
//        performSegue(withIdentifier: "colorTrigger3", sender:button3)
//    }
//    @IBAction func button4Press(_ sender: UIButton) {
//        performSegue(withIdentifier: "colorTrigger4", sender:button4)
//    }
//    @IBAction func button5Press(_ sender: UIButton) {
//        performSegue(withIdentifier: "colorTrigger5", sender:button5)
//    }
    
    //animating each button with wobbliness
    func animateButton() {
        var arrayButtons = [button1,button2,button3,button4,button5]
        for i in 0...4 {
            arrayButtons[i]?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) //scale transformation
        }
        
        UIView.animate(withDuration: 1.0, //duration of the animation
            delay: 0,
            usingSpringWithDamping: CGFloat(0.30), //wobbliness of the button
            initialSpringVelocity: CGFloat(5.0), //initial speed of the button
            options: .allowUserInteraction,
            animations: {self.button1.transform = .identity},
            completion: {finished in})
        
        UIView.animate(withDuration: 1.0, //duration of the animation
            delay: 0.1,
            usingSpringWithDamping: CGFloat(0.35), //wobbiness of the button
            initialSpringVelocity: CGFloat(5.0), //initial speed of the button
            options: .allowUserInteraction,
            animations: {self.button2.transform = .identity},
            completion: {finished in})
        
        UIView.animate(withDuration: 1.0, //duration of the animation
            delay: 0.2,
            usingSpringWithDamping: CGFloat(0.40), //wobbiness of the button
            initialSpringVelocity: CGFloat(5.0), //initial speed of the button
            options: .allowUserInteraction,
            animations: {self.button3.transform = .identity},
            completion: {finished in})
        
        UIView.animate(withDuration: 1.0, //duration of the animation
            delay: 0.3,
            usingSpringWithDamping: CGFloat(0.45), //wobbiness of the button
            initialSpringVelocity: CGFloat(5.0), //initial speed of the button
            options: .allowUserInteraction,
            animations: {self.button4.transform = .identity},
            completion: {finished in})
        
        UIView.animate(withDuration: 1.0, //duration of the animation
            delay: 0.4,
            usingSpringWithDamping: CGFloat(0.50), //wobbiness of the button
            initialSpringVelocity: CGFloat(5.0), //initial speed of the button
            options: .allowUserInteraction,
            animations: {self.button5.transform = .identity},
            completion: {finished in})
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
    
    //pushing color values to the outline screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let scene1ViewController = segue.destination as! outlineVC
        if segue.identifier == "colorTrigger1"{
            if(segueTransfer == []){
                let alert=UIAlertController(title: "Warning", message: "Please Generate", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "Generate", style: UIAlertActionStyle.default, handler: {action in
                    self.generateButton(_:self)
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                scene1ViewController.user.mode = 1
                scene1ViewController.user.redValue = segueTransfer[0]
                scene1ViewController.user.greenValue = segueTransfer[1]
                scene1ViewController.user.blueValue = segueTransfer[2]
            
                scene1ViewController.user.redSV = segureTransferString[0]
                scene1ViewController.user.greenSV = segureTransferString[1]
                scene1ViewController.user.blueSV = segureTransferString[2]
            }
        }
        if segue.identifier == "colorTrigger2"{
            if(segueTransfer == []){
                let alert=UIAlertController(title: "Warning", message: "Please Generate", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "Generate", style: UIAlertActionStyle.default, handler: {action in
                    self.generateButton(_:self)
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                scene1ViewController.user.mode = 1
                scene1ViewController.user.redValue = segueTransfer[3]
                scene1ViewController.user.greenValue = segueTransfer[4]
                scene1ViewController.user.blueValue = segueTransfer[5]
            
                scene1ViewController.user.redSV = segureTransferString[3]
                scene1ViewController.user.greenSV = segureTransferString[4]
                scene1ViewController.user.blueSV = segureTransferString[5]
            }
        }
        if segue.identifier == "colorTrigger3"{
            if(segueTransfer == []){
                let alert=UIAlertController(title: "Warning", message: "Please Generate", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "Generate", style: UIAlertActionStyle.default, handler: {action in
                    self.generateButton(_:self)
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                scene1ViewController.user.mode = 1
                scene1ViewController.user.redValue = segueTransfer[6]
                scene1ViewController.user.greenValue = segueTransfer[7]
                scene1ViewController.user.blueValue = segueTransfer[8]
            
                scene1ViewController.user.redSV = segureTransferString[6]
                scene1ViewController.user.greenSV = segureTransferString[7]
                scene1ViewController.user.blueSV = segureTransferString[8]
            }
        }
        if segue.identifier == "colorTrigger4"{
            if(segueTransfer == []){
                let alert=UIAlertController(title: "Warning", message: "Please Generate", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "Generate", style: UIAlertActionStyle.default, handler: {action in
                    self.generateButton(_:self)
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                scene1ViewController.user.mode = 1
                scene1ViewController.user.redValue = segueTransfer[9]
                scene1ViewController.user.greenValue = segueTransfer[10]
                scene1ViewController.user.blueValue = segueTransfer[11]
            
                scene1ViewController.user.redSV = segureTransferString[9]
                scene1ViewController.user.greenSV = segureTransferString[10]
                scene1ViewController.user.blueSV = segureTransferString[11]
            }
        }
        if segue.identifier == "colorTrigger5"{
            if(segueTransfer == []){
                let alert=UIAlertController(title: "Warning", message: "Please Generate", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "Generate", style: UIAlertActionStyle.default, handler: {action in
                    self.generateButton(_:self)
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                scene1ViewController.user.mode = 1
                scene1ViewController.user.redValue = segueTransfer[12]
                scene1ViewController.user.greenValue = segueTransfer[13]
                scene1ViewController.user.blueValue = segueTransfer[14]
            
                scene1ViewController.user.redSV = segureTransferString[12]
                scene1ViewController.user.greenSV = segureTransferString[13]
                scene1ViewController.user.blueSV = segureTransferString[14]
            }
        }
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

