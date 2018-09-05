//: [Previous](@previous)

import Foundation

class Solution {
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

extension Solution: Testable{
    static func valid() -> Bool{
        for (index, item ) in Solution().testcase().enumerated() {
            if item == false {
                print("验证失败，错误发生在：第\(index + 1)项目")
                return false
            }
        }
        return true
    }
    
    func testcase() -> [Bool] {
        return [
            isValid("()") == true ,
            isValid("()[]{}") == true ,
            isValid("(]") == false ,
            isValid("([)]") == false ,
            isValid("{[]}") == true,
            isValid("[") == false,
        ]
    }
}

Solution.valid()
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true
