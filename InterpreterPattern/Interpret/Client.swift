//
//  Client.swift
//  InterpreterPattern
//
//  Created by Developer on 4/12/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class Client: NSObject {
    
    func parseString(input: String) -> Double {
        // 1 Take the string part by part to create the expressions
        var expressionStack = getExpressions(stringExpression: input)
        
        // 2 Iterate over the expression list in order to reduce it
        reduceExpressions(expressionSack: &expressionStack)
        
        // 3 Return the result of the last expression
        let finalResult = expressionStack.removeFirst()
        
        return (finalResult?.interprete(ctx: InterpreterContext()))!
    }

    // Iterates over the string and creates a list of expressions
    func getExpressions(stringExpression: String) -> [AbstractExpression?] {
        var currentExpressions : [AbstractExpression?] = [AbstractExpression?]()
        var currentNumber      : String               = ""
        
        // Iterate over the strings
        for character in stringExpression {
            if isOperand(character: character) {
                let number = TerminalExpression(withNumber: currentNumber)
                currentNumber = ""
                currentExpressions.append(number)
                
                let operand = getNonTerminalExpression(operand: character)
                operand.prev = number
                currentExpressions.append(operand)
            } else {
                currentNumber.append(character)
            }
        }
        
        currentExpressions.append(TerminalExpression(withNumber: currentNumber))
        return currentExpressions
    }
    
    // Is this character an operand
    func isOperand(character: Character) -> Bool {
        return character == "+" || character == "-" || character == "*" || character == "/"
    }
    
    // Give me a non terminal expression from an string operand
    func getNonTerminalExpression(operand: Character) -> NonTerminalExpression {
        switch operand {
        case "+":
            return AddExpression()
        case "-":
            return SubstractExpression()
        case "*":
            return MultiplyExpression()
        case "/":
            return DivisionExpression()
        default:
            return NonTerminalExpression()
        }
    }
    
    // Reduces the list of expresions until it reaches one
    func reduceExpressions(expressionSack: inout [AbstractExpression?]) {
        let operationContext = InterpreterContext()
        var expressionCount = expressionSack.count;
        while expressionCount != 1 {
            let currentExpression = expressionSack.removeFirst()
            if currentExpression is TerminalExpression {
                if expressionSack.count > 0 {
                    let previousExpression = currentExpression as? TerminalExpression
                    let terminalExpression = expressionSack.removeFirst() as? NonTerminalExpression
                    let nextExpression = expressionSack.removeFirst() as? TerminalExpression
                    terminalExpression?.prev = previousExpression
                    terminalExpression?.next = nextExpression
                    let stringResult = terminalExpression?.interprete(ctx: operationContext)
                    let reduceExpression = TerminalExpression(withNumber: stringResult!.description)
                    expressionSack.insert(reduceExpression, at: 0)
                    expressionCount = expressionSack.count
                } else {
                    expressionSack.insert(currentExpression, at: 0)
                    expressionCount = expressionSack.count
                }
            } else {
                operationContext.hasError = true
            }
        }
    }
    
}
