//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Анастасия Рыбакова on 30.08.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/(height * height)
        
        switch bmiValue {
        case 0...18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .systemBlue)
        case 18.5...24.9 :
            bmi = BMI(value: bmiValue, advice: "You're good!", color: .systemGreen)
        case 25...100:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .systemRed)
        default: print("default")
        }
        
    }
    
    var getBMIValue: String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    var getAdvice: String {
        return bmi?.advice ?? "No advice for you"
    }
    
    var getColor: UIColor {
        return bmi?.color ?? UIColor.darkGray
    }
    

    
    
}
