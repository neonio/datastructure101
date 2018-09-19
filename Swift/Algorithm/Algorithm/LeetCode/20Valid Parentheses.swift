//
//  20Valid Parentheses.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//


import Foundation

fileprivate class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
        for i in s {
            switch i {
            case "(","[","{":
                stack.push(elem: i)
            case ")","]","}":
                guard let topElem = stack.peek() else { return false }
                if (topElem, i) == ("[","]") ||
                    (topElem, i) == ("{","}") ||
                    (topElem, i) == ("(",")") {
                    stack.pop()
                }else{
                    return false
                }
            default:
                return false
            }
        }
        return stack.isEmpty()
    }
}

