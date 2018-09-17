//
//  QuickSort.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/17.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class QuickSort: SortProtocol {
    // 超级慢 不知道为啥。。。
    static func sort3Ways<T:ComparableElement>(data: inout [T], lower: Int, higher: Int) {
        guard lower < higher else {
            return
        }
        if higher - lower <= 15 {
            data = InsertSort.sort(data: data)
            return
        }
        data.swapAt(lower, Int.random(in: lower..<higher))
        let v = data[lower]
        var lowerIndex = lower
        var greaterIndex = higher + 1
        var index = lower + 1
        while index < greaterIndex {
            if data[index] < v {
                data.swapAt(index, lowerIndex + 1)
                lowerIndex += 1
                index += 1
            }else if data[index] > v{
                data.swapAt(index, greaterIndex - 1)
                greaterIndex -= 1
            }else{
                index += 1
            }
        }
        data.swapAt(lowerIndex, lower)
        sort3Ways(data: &data, lower: lower, higher: lowerIndex - 1)
        sort3Ways(data: &data, lower: greaterIndex, higher: higher)
    }
    
    // 最容易理解的版本
    static func sort<T: ComparableElement>(data: [T]) -> [T] {
        guard data.count > 1 else {
            return data
        }
        let pivot = data[data.count / 2]
        let less = data.filter { $0 < pivot }
        let equal = data.filter { $0 == pivot }
        let greater = data.filter { $0 > pivot }
        return sort(data: less) + equal + sort(data: greater)
    }

    static func sort<T: ComparableElement>(data: inout [T], lower: Int, higher: Int) {
        guard lower < higher else {
            return
        }
        let pivot = partition(data: &data, lower: lower, higher: higher)
        sort(data: &data, lower: lower, higher: pivot)
        sort(data: &data, lower: pivot + 1, higher: higher)
    }

    // Partition的功能就是把數列「區分」成「小於pivot」與「大於pivot」兩半
    // 进阶的情况是：使用 i j, 从两端逼近，
    static func partition<T: ComparableElement>(data: inout [T], lower: Int, higher: Int) -> Int {
        data.swapAt(lower, Int.random(in: lower..<higher))
        let v = data[lower]
        var i = lower - 1
        var j = higher + 1
        while true {
            repeat { j -= 1 } while data[j] > v
            repeat { i += 1 } while data[i] < v
            // 这时候 j 是大于等于 v 的第一个元素，而且 v 的索引到 j 之间还可能有比 v 小的数
            // i 是小于等于 v 的第一个元素，而且 v 的索引到 j 之间还可能有比 v 大的数
            // 执行一次交换操作，这时候 data[j] < v < data[i]
            // 重复
            if i < j {
                data.swapAt(i, j)
            } else {
                return j
            }
        }
    }
}
