//
//  TerminalExpression.swift
//  InterpreterPattern
//
//  Created by Developer on 4/11/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class TerminalExpression: NSObject, AbstractExpression {
    
    private var number : String = "";
    
    init(withNumber number: String) {
        self.number = number
    }
    
    func interprete(ctx: InterpreterContext) -> Double {
        return Double(self.number)!
    }
}
