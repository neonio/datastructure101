//
//  SelectionSort.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/16.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class SelectionSort:SortProtocol{
    static func sort<T:ComparableElement>(data: [T]) -> [T]{
        var newList = data
        for i in 0..<data.count{
            var minIndex = i
            for j in (minIndex + 1)..<data.count {
                if newList[j] < newList[minIndex] {
                    minIndex = j
                }
            }
            newList.swapAt(i, minIndex)
        }
        
        return newList
    }
}
