//
//  DataSource.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/16.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
protocol SortProtocol {
    static func sort<T: ComparableElement>(data: [T]) -> [T]
}

class DataSource {
    static func createNealySortedList(count: Int, shufflePercent: Float) -> [Int] {
        assert(0 < shufflePercent && shufflePercent < 1, "Invalid shuffle percent")
        var list: [Int] = []
        for i in 0..<count {
            list.append(i)
        }
        let shuffleTime = Int(Float(count) * shufflePercent)
        for _ in 0..<shuffleTime {
            list.swapAt(Int.random(in: 0..<count), Int.random(in: 0..<count))
        }
        return list
    }
    
    static func createRandomIntList(count: Int, min: Int, max: Int) -> [Int] {
        var list: [Int] = []
        for _ in 0..<count {
            list.append(Int.random(in: min...max))
        }
        return list
    }
    
    static func timeit(action: (() -> ()), count: Int) -> TimeInterval {
        var timeSum: TimeInterval = 0
        for _ in 0..<count {
            let startTime = Date()
            action()
            timeSum += Date().timeIntervalSince(startTime)
        }
        return timeSum / Double(count)
    }
    
    static func timethem(first:(() -> ()), last:(() -> ()),count:Int) {
        var timeSum: TimeInterval = 0
        for _ in 0..<count {
            let startTime = Date()
            first()
            timeSum += Date().timeIntervalSince(startTime)
        }
        print("first average: \(timeSum / Double(count))")
        timeSum = 0
        for _ in 0..<count {
            let startTime = Date()
            last()
            timeSum += Date().timeIntervalSince(startTime)
        }
        print("second average: \(timeSum / Double(count))")
    }
    
    static func isValid<T: ComparableElement>(list: [T], compare: ((T, T) -> Bool)) -> Bool {
        for i in 0..<(list.count - 1) {
            if !compare(list[i], list[i + 1]) {
                return false
            }
        }
        return true
    }
}
