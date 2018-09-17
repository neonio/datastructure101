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

var list = DataSource.createRandomIntList(count: 10000, min: 0, max: 100)
//let time = DataSource.timeit(action: {
//    list = MergeSort.mergeBottomUp(list: list)
//        list = MergeSort.merge(list: list)
//    list = list.sorted()
//}, count: 20)
DataSource.timethem(first: {
    list = InsertSort.sort(data: list)
    print("\(DataSource.isValid(list: list, compare: <=))")
}, last: {
    list = MergeSort.mergeBottomUp(list: list)
    print("\(DataSource.isValid(list: list, compare: <=))")
}, count: 20)



