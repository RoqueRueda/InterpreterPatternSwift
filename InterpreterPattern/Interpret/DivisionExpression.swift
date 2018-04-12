//
//  DivisionExpression.swift
//  InterpreterPattern
//
//  Created by Developer on 4/12/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class DivisionExpression: NonTerminalExpression {
    
    override func interprete(ctx: InterpreterContext) -> Double {
        return prev.interprete(ctx: ctx) / next.interprete(ctx: ctx)
    }

}
