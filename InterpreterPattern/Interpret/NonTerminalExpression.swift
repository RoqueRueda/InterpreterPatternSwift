//
//  NonTerminalExpression.swift
//  InterpreterPattern
//
//  Created by Developer on 4/11/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NonTerminalExpression: NSObject, AbstractExpression {
    
    var prev : AbstractExpression?
    var next : AbstractExpression?
    
    init(withExpressions prev: AbstractExpression?, next: AbstractExpression?) {
        self.prev = prev
        self.next = next
    }
    
    override init() {
        prev = nil
        next = nil
    }
    
    func interprete(ctx: InterpreterContext) -> Double {
        return 0;
    }
}
