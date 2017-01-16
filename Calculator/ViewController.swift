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
    private var previousValue: Int?
    private var previousArith: String?
    private var shouldClearDisplay: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func numOrArithTapped(_ sender: Any) {
        let buttonText = (sender as! UIButton).titleLabel!.text!
        if let int = Int(buttonText) {
            if valueLabel.text! == "0" || shouldClearDisplay {
                valueLabel.text! = ""
                shouldClearDisplay = false
            }
            valueLabel.text! += "\(int)"
        }else if previousArith != buttonText {
            arithTapped(buttonText)
        }
    }
    
    private func arithTapped(_ char: String) {
        performArith(char)
    }
    
    private func performArith(_ prevArith: String? = nil) {
        if previousValue != nil && previousArith != nil {
            valueLabel.text =  performArith(forChar: previousArith!, val1: previousValue!, val2: Int(valueLabel.text!)!)
        }
        previousValue = Int(valueLabel.text!)
        shouldClearDisplay = true
        previousArith = prevArith
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        valueLabel.text! = "0"
        previousValue = nil
        previousArith = nil
    }
    
    @IBAction func equalsTapped(_ sender: Any) {
        performArith(nil)
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


