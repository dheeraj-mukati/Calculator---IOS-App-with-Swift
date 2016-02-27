//
//  ViewController.swift
//  Calculator
//
//  Created by Dheeraj Mukati on 2/24/16.
//  Copyright © 2016 Dheeraj Mukati. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func apendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            
            display.text = display.text! + digit
        }else{
                display.text = digit
                userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
            
            case "×" : performOperation() { $0 * $1 }
            case "÷" : performOperation() { $0 / $1 }
            case "+" : performOperation() { $0 + $1 }
            case "−" : performOperation() { $0 - $1 }
            case "√" : performOperation2() { sqrt($0) }
            default:  break
        }
    }

    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation2(operation: Double -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}

