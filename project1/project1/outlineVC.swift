//
//  outlineVC.swift
//  project1
//
//  Created by Pujan Tandukar on 10/4/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class outlineVC: UIViewController {
    
    var user = colorValues()
    
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
//    var x:CGFloat = 0.865284979343414; var y:CGFloat = 0.393782377243042; var z:CGFloat = 0.393782377243042;
    var x:CGFloat = 0; var y:CGFloat = 0; var z:CGFloat = 0;
    var hexR:Int=0; var hexG:Int=0; var hexB:Int=0;
    
    @IBOutlet weak var redSliderValue: UISlider!
    @IBOutlet weak var greenSliderValue: UISlider!
    @IBOutlet weak var blueSliderValue: UISlider!
    
    @IBAction func redSlider(_ sender: UISlider) {
        hexR = Int(sender.value)
//        var redS = CGFloat(220)
        let redS = CGFloat(Float((sender.value)/255))
        redLabel.text = String(Int(sender.value))
        x = redS
        update()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        hexG = Int(sender.value)
//        var greenS = CGFloat(100)
        let greenS = CGFloat(Float((sender.value)/255))
        greenLabel.text = String(Int(sender.value))
        y = greenS
        update()
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        hexB = Int(sender.value)
//        var blueS = CGFloat(100)
        let blueS = CGFloat(Float((sender.value)/255))
        blueLabel.text = String(Int(sender.value))
        z = blueS
        update()
    }
    
    func update(){
//        var redVal = CGFloat(user.redValue!)
        buttonMain.backgroundColor = UIColor(red: x, green: y, blue: z, alpha: 255)
        let WC:CGFloat = 1.0;
        let BC:CGFloat = 0.0;
        let xx = deci2Hex(num: hexR)
        let yy = deci2Hex(num: hexG)
        let zz = deci2Hex(num: hexB)
        let colorName = xx + yy + zz
        buttonMain.setTitle("#" + colorName, for: .normal)
        
        if checkStrength(a: hexR, b: hexG, c: hexB) == true {
            buttonMain.setTitleColor(UIColor(red: BC, green: BC, blue: BC, alpha: 255), for: .normal)
        }
        else{
            buttonMain.setTitleColor(UIColor(red: WC, green: WC, blue: WC, alpha: 255), for: .normal)
        }
    }
    
    func checkStrength(a:Int,b:Int,c:Int) -> Bool{
        if((a>=150 && b>=150) || (a>=150 && c>=150) || (b>=150 && c>=150)){
            return true
        }
        else{
            return false
        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(user.mode == 1){
        let redVal = CGFloat(user.redValue!)
        let greenVal = CGFloat(user.greenValue!)
        let blueVal = CGFloat(user.blueValue!)
        let redSVal = user.redSV
        let greenSVal = user.greenSV
        let blueSVal = user.blueSV
        let xx = deci2Hex(num: redSVal!)
        let yy = deci2Hex(num: greenSVal!)
        let zz = deci2Hex(num: blueSVal!)
        let colorName = xx + yy + zz
        buttonMain.setTitle("#" + colorName, for: .normal)
        
        x = CGFloat(user.redValue!)
        y = CGFloat(user.greenValue!)
        z = CGFloat(user.blueValue!)
        hexR = user.redSV!
        hexG = user.greenSV!
        hexB = user.blueSV!

        redSliderValue.value = Float(user.redSV!)
        greenSliderValue.value = Float(user.greenSV!)
        blueSliderValue.value = Float(user.blueSV!)
            
        redLabel.text = String(Int(user.redSV!))
        greenLabel.text = String(Int(user.greenSV!))
        blueLabel.text = String(Int(user.blueSV!))
            
        buttonMain.backgroundColor = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 255)
        }
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
