//
//  ViewController.swift
//  midterm
//
//  Created by Pujan Tandukar on 10/19/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//
//  Made in aspect ratio of iPhone 7!

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let carSpeed = 20.0
    let bikeSpeed = 10.0
    let busSpeed = 12.0
    var monthlyCar = 0.0
    var monthlyBus = 0.0
    var monthlyBike = 0.0
    var dailyCar = 0.0
    var dailyBus = 0.0
    var dailyBike = 0.0
    var dailyGas = 0.0
    var monthlyGas = 0.0
    var count = 0
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    @IBOutlet weak var roundTripTextfield: UITextField!
    
    @IBOutlet weak var switchStatus: UISwitch!
    
    @IBAction func showMonthlySwitch(_ sender: Any) {
        if(modeSegmentedControl.selectedSegmentIndex == 0 && switchStatus.isOn == true){
            totalCommuteTimeLabel.text = String(monthlyCar) + " hours"
            totalGallonLabel.text = String(monthlyGas) + " gallons"
        }
        if(modeSegmentedControl.selectedSegmentIndex == 1 && switchStatus.isOn == true){
            totalCommuteTimeLabel.text = String(monthlyBus) + " hours"
        }
        if(modeSegmentedControl.selectedSegmentIndex == 2 && switchStatus.isOn == true){
            totalCommuteTimeLabel.text = String(monthlyBike) + " hours"
        }
        
        if(modeSegmentedControl.selectedSegmentIndex == 0 && switchStatus.isOn == false){
            totalCommuteTimeLabel.text = String(dailyCar) + " hours"
            totalGallonLabel.text = String(dailyGas) + " gallons"
        }
        if(modeSegmentedControl.selectedSegmentIndex == 1 && switchStatus.isOn == false){
            totalCommuteTimeLabel.text = String(dailyBus) + " hours"
        }
        if(modeSegmentedControl.selectedSegmentIndex == 2 && switchStatus.isOn == false){
            totalCommuteTimeLabel.text = String(dailyBike) + " hours"
        }
    }
    
    @IBAction func gasSlider(_ sender: UISlider) {
        let value = round((Float(sender.value))*100)/100
        gasLabel.text = String(value) + " gallons"
        
    }
    @IBOutlet weak var gasLabel: UILabel!
    
    @IBAction func commuteMainButton(_ sender: UIButton) {
//        if(count==0){
        generate()
        count+=1
//        }
    }

    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if(count >= 1){
        if(modeSegmentedControl.selectedSegmentIndex == 0){
            transportImage.image = UIImage(named: "car")
            generate()
        }
        if(modeSegmentedControl.selectedSegmentIndex == 1){
            transportImage.image = UIImage(named: "bus")
            generate()
        }
        if(modeSegmentedControl.selectedSegmentIndex == 2){
            transportImage.image = UIImage(named: "bike")
            generate()
        }
    }
    }
    
   
    func generate(){
        let x = Double(roundTripTextfield.text!)
        if(Int(x!) >= 50){
            let alert=UIAlertController(title: "Warning", message: "Your commute is over 50 MILES!", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Okay", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            present(alert, animated: true, completion: nil)
        }
        var y = 0.0
        if(modeSegmentedControl.selectedSegmentIndex == 0){
            speedLabel.text = String(carSpeed) + " mph"
            y = round((x! / carSpeed)*100)/100
//            totalCommuteTimeLabel.text = String(y) + " hours"
            let z = round((x! / 24)*100)/100
            totalGallonLabel.text = String(z) + " gallons"
            monthlyCar = y * 20
            dailyCar = y
            monthlyGas = z*20
            dailyGas = z
            transportImage.image = UIImage(named: "car")
            if(switchStatus.isOn == true){
                totalCommuteTimeLabel.text = String(monthlyCar) + " hours"
            }
            else{
                totalCommuteTimeLabel.text = String(dailyCar) + " hours"
            }
            
            let alert=UIAlertController(title: "Idea!", message: "Are you driving alone? What about Carpool :D", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Okay", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            present(alert, animated: true, completion: nil)
        }
        if(modeSegmentedControl.selectedSegmentIndex == 1){
            speedLabel.text = String(busSpeed) + " mph"
            y = round(((x! / busSpeed) + (10/60))*100)/100
            let z = round(y*100)/100
            totalCommuteTimeLabel.text = String(z) + " hours"
            totalGallonLabel.text = "0 gallons"
            monthlyBus = y * 20
            dailyBus = y
            transportImage.image = UIImage(named: "bus")
            if(switchStatus.isOn == true){
                totalCommuteTimeLabel.text = String(monthlyBus) + " hours"
            }
            else{
                totalCommuteTimeLabel.text = String(dailyBus) + " hours"
            }
            
        }
        if(modeSegmentedControl.selectedSegmentIndex == 2){
            speedLabel.text = String(bikeSpeed) + " mph"
            y = round((x! / bikeSpeed)*100)/100
            totalCommuteTimeLabel.text = String(y) + " hours"
            totalGallonLabel.text = "0 gallons"
            monthlyBike = y * 20
            dailyBike = y
            transportImage.image = UIImage(named: "bike")
            if(switchStatus.isOn == true){
                totalCommuteTimeLabel.text = String(monthlyBike) + " hours"
            }
            else{
                totalCommuteTimeLabel.text = String(dailyBike) + " hours"
            }
        }
    }
    
    @IBOutlet weak var totalCommuteTimeLabel: UILabel!
    @IBOutlet weak var totalGallonLabel: UILabel!
    @IBOutlet weak var transportImage: UIImageView!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        roundTripTextfield.delegate = self
        view.addGestureRecognizer(tapGes)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideKeyboard(){
        view.endEditing(true)
    }
}

