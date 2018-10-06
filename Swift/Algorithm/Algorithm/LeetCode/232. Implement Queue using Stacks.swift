//
//  232. Implement Queue using Stacks.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/29.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class MyQueue {
    var stackIn = Stack<Int>()
    var stackOut = Stack<Int>()
    func push(elem:Int) {
        stackIn.push(elem: elem)
    }
    
    func pop() -> Int? {
        guard stackOut.size > 0 || stackIn.size > 0 else { return nil }
        if stackOut.size > 0 {
            return stackOut.pop()
        }else{
            while !stackIn.isEmpty() {
                if let popElem = stackIn.pop() {
                    stackOut.push(elem: popElem)
                }
            }
            return stackOut.pop()
        }
    }
    
    func peek() -> Int? {
        if stackOut.size > 0 {
            return stackOut.peek()
        }else{
            if stackIn.size > 0 {
                while !stackIn.isEmpty() {
                    if let popElem = stackIn.pop() {
                        stackOut.push(elem: popElem)
                    }
                }
                return stackOut.peek()
            }else{
                return nil
            }
        }
    }
}
