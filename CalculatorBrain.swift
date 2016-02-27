//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Dheeraj Mukati on 2/24/16.
//  Copyright © 2016 Dheeraj Mukati. All rights reserved.
//

import Foundation

class CaculatorBrain
{
    private enum Op{
        case Operand(Double)
        case UnaryOpeartion(String, Double -> Double)
        case BinaryOpeartion(String, (Double, Double) -> Double)

    }
    
    private var opStack = [Op]()
    private var knownOps = [String: Op]()

    init(){
        knownOps["+"] = Op.BinaryOpeartion("+", +)
        knownOps["−"] = Op.BinaryOpeartion("−") { $1 - $0 }
        knownOps["×"] = Op.BinaryOpeartion("×", *)
        knownOps["÷"] = Op.BinaryOpeartion("÷") { $1 / $0 }
        knownOps["√"] = Op.UnaryOpeartion("√", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double? , remainingOps: [Op]){
        
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        
        return nil
    }
    func pushOperand(operand: Double){
        opStack.append(Op.Operand(operand))
    }
    
    func performOps(symbol: String){
        if let operation = knownOps[symbol]{
            opStack.append(operation)
        }
    }
}