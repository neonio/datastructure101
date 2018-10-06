//
//  347 Top K Frequent Elements.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P347 {
    class Solution {
        class FreqModel :Comparable, CustomDebugStringConvertible{
            // 对于这个题目, 我们希望让频次小的优先出队
            // 那么就需要改变优先级的定义
            static func < (lhs: Solution.FreqModel, rhs: Solution.FreqModel) -> Bool {
                return lhs.freq > rhs.freq
            }
            
            var debugDescription: String {
                return "([\(value)]:\(freq))"
            }
            
            static func == (lhs: Solution.FreqModel, rhs: Solution.FreqModel) -> Bool {
                return lhs.value == rhs.value && lhs.freq == rhs.freq
            }
            
            var value:Int
            var freq: Int
            init(value: Int, freq: Int) {
                self.value = value
                self.freq = freq
            }
        }
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            var freqMap:[Int:Int] = [:]
            for item in nums {
                if freqMap[item] == nil {
                    freqMap[item] = 1
                }else{
                    let newValue = (freqMap[item] ?? 0) + 1
                    freqMap[item] = newValue
                }
            }
            let maxQueue = PriorityQueue<FreqModel>()
            for (key, value) in freqMap {
                let fModel = FreqModel(value: key, freq: value)
                if maxQueue.size < k {
                    maxQueue.enqueue(elem: fModel)
                }else{
                    if let headElem = maxQueue.getHead() {
                        if headElem > fModel {
                            maxQueue.dequeue()
                            maxQueue.enqueue(elem: fModel)
                        }
                    }
                }
            }
            var valuelist:[Int] = []
            while !maxQueue.isEmpty {
                if let valueKey = maxQueue.dequeue()?.value {
                    valuelist.append(valueKey)
                }
            }
            return valuelist.sorted()
        }
    }
}
