//
//  125. Valid Palindrome.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P125 {
    class Solution {
        func isPalindrome(_ s: String) -> Bool {
            var l = 0
            var r = s.count - 1
            guard r >= 0 else {
                return true
            }
            while l <= r {
                let isLeftTargetChar = s[l].isTargetCharacter()
                let isRightTargetChar = s[r].isTargetCharacter()
                if isLeftTargetChar && isRightTargetChar {
                    if s[l].alphaEqual(oStr: s[r]) {
                        l += 1
                        r -= 1
                    } else {
                        return false
                    }
                } else {
                    if !isLeftTargetChar {
                        l += 1
                        continue
                    }
                    if !isRightTargetChar {
                        r -= 1
                        continue
                    }
                }
            }
            return true
        }
    }
}

fileprivate extension String {
    func alphaEqual(oStr:String) -> Bool {
        var value:UInt32 = 0
        if let char = self.unicodeScalars.first {
            value = char.value
            if value >= 97 && value <= 122 {
                value -= 32
            }
        }
        var oCharValue:UInt32 = 0
        if let oChar = oStr.unicodeScalars.first {
            oCharValue = oChar.value
            if oCharValue >= 97 && oCharValue <= 122 {
                oCharValue -= 32
            }
        }
        return value == oCharValue
    }
    
    func isTargetCharacter() -> Bool {
        if let char = self.unicodeScalars.first {
            let value = char.value
            return value >= 97 && value <= 122 || value >= 48 && value <= 57 || value >= 65 && value <= 90
        } else {
            return false
        }
    }

    subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    subscript(index: Int) -> String {
        return self[index...index]
    }
}

