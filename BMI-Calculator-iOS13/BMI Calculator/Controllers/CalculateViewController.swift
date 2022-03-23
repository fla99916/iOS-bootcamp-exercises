//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    @IBAction func heightSliderMoved(_ sender: UISlider) {
        //Leave 2 decimals
        //let heightValue = round(sender.value * 100 ) / 100.0
        let heightValue = String(format: "%.2f", sender.value)
        
        heightLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weightSliderMoved(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        //Convert from Float to Int
        //let wieghtValue = Int(sender.value)
        
        weightLabel.text = "\(weightValue)Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height,weight: weight)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
      //Manually load ResultViewController
//        let secondVC = ResultViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//
//        self.present(secondVC, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            //segue.destination returns UIViewController but it is necesarry to recognize as ResultViewController
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

