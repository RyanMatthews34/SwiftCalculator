//
//  ViewController.swift
//  Calculator
//
//  Created by Yogesh Makwana on 2019-05-14.
//  Copyright © 2019 Yogesh Makwana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: class properties
    var calculations = Calculations()
    var readyToClearDisplay = false
    
    //Mark: Outlets
    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    @IBOutlet var allButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Event Listeners
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        print(sender.currentTitle!)
        //TODO: Do something with the key just pressed.
        
        var currentVal = numberDisplayLabel.text!
        
        switch sender.currentTitle {
        case "0", "1", "2","3","4","5","6","7","8","9":
            
            if currentVal == "0" {
                if (!readyToClearDisplay) {
                    currentVal = sender.currentTitle!
                } else {
                    currentVal = sender.currentTitle!
                    readyToClearDisplay = false
                }
            } else {
                if (!readyToClearDisplay) {
                    currentVal = currentVal + sender.currentTitle!
                } else {
                    currentVal = sender.currentTitle!
                    readyToClearDisplay = false
                }
            }
        case "C":
            //TODO: Clear text
            currentVal = "0"
            calculations.reset()
            break
        case ".":
            //TODO: process .
            if (!currentVal.contains(".")) {
                currentVal += "."
            }
            break
            
        case "+":
            if (calculations.firstNumber != nil) {
                calculations.secondNumber = Double(currentVal)
                if let result = calculations.calculateResult() {
                    currentVal = String(format: "%g", result)
                    calculations.firstNumber = result
                    calculations.operation = sender.currentTitle
                    calculations.secondNumber = nil
                    
                } else {
                    currentVal = "Error"
                }
            } else {
                calculations.firstNumber = Double(currentVal)
                calculations.operation = sender.currentTitle
                readyToClearDisplay = true
            }
            calculations.firstNumber = Double(currentVal)
            calculations.operation = sender.currentTitle
            readyToClearDisplay = true
            
        case "-":
            if (calculations.firstNumber != nil) {
                calculations.secondNumber = Double(currentVal)
                if let result = calculations.calculateResult() {
                    currentVal = String(format: "%g", result)
                    calculations.firstNumber = result
                    calculations.operation = sender.currentTitle
                    calculations.secondNumber = nil
                    
                } else {
                    currentVal = "Error"
                }
            } else {
                calculations.firstNumber = Double(currentVal)
                calculations.operation = sender.currentTitle
                readyToClearDisplay = true
            }
            calculations.firstNumber = Double(currentVal)
            calculations.operation = sender.currentTitle
            readyToClearDisplay = true
            
        case "*":
            if (calculations.firstNumber != nil) {
                calculations.secondNumber = Double(currentVal)
                if let result = calculations.calculateResult() {
                    currentVal = String(format: "%g", result)
                    calculations.firstNumber = result
                    calculations.operation = sender.currentTitle
                    calculations.secondNumber = nil
                    
                } else {
                    currentVal = "Error"
                }
            } else {
                calculations.firstNumber = Double(currentVal)
                calculations.operation = sender.currentTitle
                readyToClearDisplay = true
            }
            calculations.firstNumber = Double(currentVal)
            calculations.operation = sender.currentTitle
            readyToClearDisplay = true
            
        case "/":
            if (calculations.firstNumber != nil) {
                calculations.secondNumber = Double(currentVal)
                if let result = calculations.calculateResult() {
                    currentVal = String(format: "%g", result)
                    calculations.firstNumber = result
                    calculations.operation = sender.currentTitle
                    calculations.secondNumber = nil
                    
                } else {
                    currentVal = "Error"
                }
            } else {
                calculations.firstNumber = Double(currentVal)
                calculations.operation = sender.currentTitle
                readyToClearDisplay = true
            }
            calculations.firstNumber = Double(currentVal)
            calculations.operation = sender.currentTitle
            readyToClearDisplay = true
            
        case "=":
            calculations.secondNumber = Double(currentVal)
            if let result = calculations.calculateResult() {
                currentVal = String(format: "%g", result)
            } else {
                currentVal = "Error"
            }
            calculations.reset()
            readyToClearDisplay = false
            
            
            
            
        default:
            break
        }
        numberDisplayLabel.text! = currentVal
        
    }
    
}
