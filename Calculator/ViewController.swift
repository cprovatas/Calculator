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
            if valueLabel.text! == "0" || previousValue != nil {
                valueLabel.text! = ""
            }
            valueLabel.text! += "\(int)"
        }else {
            arithTapped(buttonText)
        }
        
    }
    
    var previousValue: Int?
    var previousArith: String?
    
    func arithTapped(_ char: String) {
        
        if previousValue != nil && previousArith != nil {
           valueLabel.text =  performArith(forChar: previousArith!, val1: previousValue!, val2: Int(valueLabel.text!)!)
            
        }
        
        previousValue = Int(valueLabel.text!)
        previousArith = char
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        valueLabel.text! = "0"
        previousValue = nil
    }
    
    @IBAction func equalsTapped(_ sender: Any) {
        
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


