//
//  345. Reverse Vowels of a String.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/19.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P345 {
    class Solution {
        func reverseVowels(_ s: String) -> String {
            guard !s.isEmpty else { return s}
            var left:Int = -1
            var right:Int = s.count
            var newS = Array(s)
            while left <= right {
                repeat {left += 1} while left < newS.count && !newS[left].isVowel()
                repeat {right -= 1} while right > 0 && !newS[right].isVowel()
                if left < right && newS[left].isVowel() && newS[right].isVowel() {
                    newS.swapAt(left, right)
                }else{
                    if right < left {
                        return String(newS)
                    }
                }
            }
            return s
        }
        
    }
}

extension Character {
    func isVowel() -> Bool {
        return "aeiouAEIOU".contains(self)
    }
}

