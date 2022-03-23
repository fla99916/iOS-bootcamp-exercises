//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Yelim Kim on 12/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    //before calculating the bmi, the value can be null
    var bmiValue: BMI?
    
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmi = weight/(height*height)
        if bmi < 18.5 {
            //Underweight
            bmiValue = BMI(value: bmi, advice: "Eat more pies!", color: UIColor.blue)
        } else if bmi <= 24.9 {
            //Normal
            bmiValue = BMI(value: bmi, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            //Overweight
            bmiValue = BMI(value: bmi, advice: "Eat less pies!", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String {
//        if let safeBMI = bmiValue  {
//            return String(format: "%.1f", safeBMI)
//        } else {
//           return "0.0"
//        }
        let bmiTO1DecimalPlace = String(format: "%.1f", bmiValue?.value ?? 0.0)
        return bmiTO1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? UIColor.black
    }
}

