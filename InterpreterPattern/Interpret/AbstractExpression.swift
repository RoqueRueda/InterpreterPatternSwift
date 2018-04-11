//
//  AbstractExpression.swift
//  InterpreterPattern
//
//  Created by Developer on 4/11/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

protocol AbstractExpression {
    
    func interprete(ctx: InterpreterContext) -> Double

}
