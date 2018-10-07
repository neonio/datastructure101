//
//  127. Word Ladder.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/7.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P127 {
    class Solution {
        func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
            if !wordList.contains(endWord) {
                return 0
            }
            let a2z = Array("abcdefghijklmnopqrstuvwxyz")
            var beginSet = Set<String>()
            var endSet = Set<String>()
            var len = 1
            var visit = Set<String>()
            
            beginSet.insert(beginWord)
            endSet.insert(endWord)
            
            while !beginSet.isEmpty && !endSet.isEmpty {
                //optimize
                if beginSet.count > endSet.count {
                    swap(&beginSet, &endSet)
                }
                var temp = Set<String>()
                for word in beginSet {
                    var chars = Array(word)
                    for i in 0..<word.count {
                        for j in 0..<a2z.count {
                            let old = chars[i]
                            chars[i] = a2z[j]
                            let target = String(chars)
                            if endSet.contains(target) {
                                return len + 1
                            }
                            if !visit.contains(target) && wordList.contains(target) {
                                temp.insert(target)
                                visit.insert(target)
                            }
                            
                            //restore
                            chars[i] = old
                        }
                    }
                }
                beginSet = temp
                len += 1
            }
            return 0
        }
    }
}
