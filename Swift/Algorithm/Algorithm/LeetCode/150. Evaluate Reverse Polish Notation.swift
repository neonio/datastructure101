//
//  150. Evaluate Reverse Polish Notation.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P150 {
    enum Operators:String, CaseIterable {
        case add = "+"
        case sub = "-"
        case mul = "*"
        case div = "/"
        
        
        
        func doAction(right:Int, left:Int) -> Int {
            switch self {
            case .add:
                return left + right
            case .sub:
                return left - right
            case .mul:
                return left * right
            case .div:
                return left / right
            }
        }
    }
    
    class Solution {
        let allCases = Operators.allCases.map { (op) -> String in
            return op.rawValue
        }
        var stack:Stack<Int> = Stack<Int>()
        func evalRPN(_ tokens: [String]) -> Int {
            for i in tokens {
                if let op = Operators(rawValue: i) {
                    guard let left = stack.pop(), let right = stack.pop() else {
                        return 0
                    }
                    let result = op.doAction(right: left, left: right)
                    stack.push(elem: result)
                }else{
                    stack.push(elem: Int(i)!)
                }
            }
            return stack.pop() ?? 0
        }
    }
}
