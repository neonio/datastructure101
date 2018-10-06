//
//  804Unique Morse Code Words.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation


class P804 {
    class Solution {
        let alpha:[String] = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        let charSet:[Character] = "abcdefghijklmnopqrstuvwxyz".map { (char) -> Character in
            return char
        }
        lazy var result: [Character: String] = {
            var result:[Character: String] = [:]
            for (index, value) in charSet.enumerated() {
                result[value] = alpha[index]
            }
            return result
        }()
        
        func uniqueMorseRepresentations(_ words: [String]) -> Int {
            let convertedWordList = words.map { (word) -> String in
                let convertedWord = word.map({ (char) -> String in
                    return result[char]!
                })
                return convertedWord.joined()
            }
            return Set(convertedWordList).count
        }
    }
}

