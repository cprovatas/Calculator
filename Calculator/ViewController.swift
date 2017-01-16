//
//  ViewController.swift
//  Calculator
//
//  Created by Charlton Provatas on 1/15/17.
//  Copyright © 2017 Charlton Provatas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var arrayOfVals: [String] = []
    
    @IBAction func numOrArithTapped(_ sender: Any) {
        let buttonText = (sender as! UIButton).titleLabel!.text!
        if let int = Int(buttonText) {
            if valueLabel.text! == "0" {
                valueLabel.text! = ""
            }
            valueLabel.text! += "\(int)"
        }
        
        arrayOfVals.append(buttonText)
        calculateVals()
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        valueLabel.text! = "0"
        arrayOfVals.removeAll()
    }
    
    @IBAction func equalsTapped(_ sender: Any) {
        arrayOfVals.append("+")
        calculateVals()
        arrayOfVals.removeAll()        
    }
    
    private func calculateVals() {
        var previousString = ""
        var previousValue = 0
        var currentArith = ""
        for val in arrayOfVals {
            if let int = Int(val) {
                previousString += val
                if currentArith != "" {
                    valueLabel.text! = previousString
                }
                
            }else {
                if currentArith != "" {
                    if let num = Int(previousString) {
                        let r = performArith(forChar: currentArith, val1: previousValue, val2: num)
                        valueLabel.text! = r
                        previousValue = Int(r)!
                    }else {
                        currentArith = val
                    }
                }else {
                    if let num = Int(previousString) {
                        previousValue = num
                    }
                }
                previousString = ""
                currentArith = val
            }
        }
    }
    
    private func performArith(forChar char: String, val1: Int, val2: Int) -> String {
        
        if !char.isArith() { return "" }
        
        switch char {
        case "+":
            return "\(val1 + val2)"
            break
        case "-":
            return "\(val1 - val2)"
            break
        case "/":
            return "\(val1 / val2)"
            break
        case "*":
            return "\(val1 * val2)"
            break
        default:
            return ""
            break
        }
    }
    
}


fileprivate extension String {
    func isArith() -> Bool {
        return self == "*" || self == "-" || self == "+" || self == "/"
    }
}


