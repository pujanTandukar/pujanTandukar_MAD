//
//  ViewController.swift
//  lab3
//
//  Created by Pujan Tandukar on 9/26/17.
//  Copyright © 2017 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var loanAmt: UITextField!
    @IBOutlet weak var monthlyIncome: UITextField!
    @IBOutlet weak var perLoan: UITextField!
    @IBOutlet weak var amtLeft: UILabel!
    @IBOutlet weak var monthLeft: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGes)
        loanAmt.delegate = self
        monthlyIncome.delegate = self
        perLoan.delegate = self
         super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateAmountLeft(){
        var amount:Float
        var amtPM: Float
        var perL: Float = 0.0
//        var mLeft: Float
    
        if monthlyIncome.text!.isEmpty{
            amtPM = 0.0
        }
        else{
            amtPM = Float(monthlyIncome.text!)!
        }
        
        if perLoan.text!.isEmpty{
            perL = 0.0
        } else {
            perL = Float(perLoan.text!)!
            if perL < 4.5{
                let alert=UIAlertController(title: "Warning", message: "Loan % per month has to be > 4.5", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.perLoan.text!="4.5"
                    self.updateAmountLeft()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
                
            else{
                perL = Float(perLoan.text!)!/100
            }
        }
    
      

        
//        if perLoan != nil {
//            if Float(perLoan.text!)! > 4.5 {
//                perL =  Float(perLoan.text!)!/100
//            }else {
//                //create a UIAlertController object
//                let alert=UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
//                //create a UIAlertAction object for the button
//                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
//                alert.addAction(cancelAction) //adds the alert action to the alert object
//                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
//                    self.perLoan.text="4.5"
//                    self.updateAmountLeft()
//                })
//                alert.addAction(okAction)
//                present(alert, animated: true, completion: nil)
//            } //end else
//        }
//        
        
        let amountCanSpend = perL * amtPM
        
        if loanAmt.text!.isEmpty{
            amount = 0.0;
        }
        else{
            amount = Float(loanAmt.text!)!
        }
        
        let amountOfMoneyLeft = amount - amountCanSpend
        let monLeft = amountOfMoneyLeft / amountCanSpend
        
        let moneyFormatter = NumberFormatter()
        moneyFormatter.numberStyle = NumberFormatter.Style.currency
        amtLeft.text = moneyFormatter.string(from: NSNumber(value: amountOfMoneyLeft))
//        amtLeft.text = moneyFormatter.string(from: NSNumber(value: monLeft))
//        amtLeft.text = String(amountOfMoneyLeft)
        monthLeft.text = String(monLeft)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateAmountLeft()
    }
    func hideKeyboard(){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

