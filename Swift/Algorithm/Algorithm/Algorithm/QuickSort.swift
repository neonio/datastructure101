//
//  QuickSort.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/17.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class QuickSort:SortProtocol{
    static func sort<T:ComparableElement>(data: [T]) -> [T] {
        guard data.count > 1 else {
            return data
        }
        var newList = data
        let seperatePoint = partition(list: newList)
        newList = sort(data: Array(newList[0..<(seperatePoint-1)]))
        newList = sort(data: Array(newList[(seperatePoint + 1)..<newList.count]))
        return newList
    }
    
    static func partition<T:ComparableElement>(list:[T]) -> Int{
        return 0
    }
}
