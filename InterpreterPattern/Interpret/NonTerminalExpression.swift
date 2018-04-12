//
//  NonTerminalExpression.swift
//  InterpreterPattern
//
//  Created by Developer on 4/11/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NonTerminalExpression: NSObject, AbstractExpression {
    
    private var prev : AbstractExpression
    private var next : AbstractExpression
    
    init(withExpressions prev: AbstractExpression, next: AbstractExpression) {
        self.prev = prev
        self.next = next
    }
    
    func interprete(ctx: InterpreterContext) -> Double {
        return 0;
    }
}
