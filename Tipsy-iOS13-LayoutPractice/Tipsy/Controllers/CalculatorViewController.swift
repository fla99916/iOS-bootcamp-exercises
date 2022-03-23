//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButtion: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!

    var tip = 0.10
    var numPeople: Int = 2
    var billTotal: Double = 0.0
    var resultTwoDecimal: String = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButtion.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        var valueButton = sender.title(for: .normal)!
        valueButton.removeLast()
        tip = Double(valueButton)!/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numPeople = Int(sender.value)
        splitNumberLabel.text = String(numPeople)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
     
            
            let resultDouble = billTotal * (1 + tip) / Double(numPeople)
            resultTwoDecimal = String(format: "%.2f", resultDouble)
            print(resultTwoDecimal)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(resultTwoDecimal)
            destinationVC.numPeople = numPeople
            destinationVC.tip = String(format:"%.0f", tip*100)
        }
    }
}

