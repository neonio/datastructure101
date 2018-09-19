//
//  main.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
extension Int: CustomDebugStringConvertible  {
    public var debugDescription: String {
        return "\(self)"
    }
}

var list = DataSource.createNealySortedList(count: 100, shufflePercent: 0.1)
var newList = DataSource.createRandomIntList(count: 10000, min: 0, max: 100)
//let time = DataSource.timeit(action: {
//    list = MergeSort.mergeBottomUp(list: list)
//        list = MergeSort.merge(list: list)
//    list = list.sorted()
//}, count: 20)
DataSource.timethem(first: {
//    list = InsertSort.sort(data: list)
//    QuickSort.sort(data: &list, lower: 0, higher: list.count - 1)
//    assert(DataSource.isValid(list: list, compare: <=), "Error")
    
}, last: {
    
//    QuickSort.sort3Ways(data: &list, lower: 0, higher: list.count-1)
//    assert(DataSource.isValid(list: list, compare: <=), "Error")
}, count: 2)

Exec().exec()





