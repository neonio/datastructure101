//
//  InsertSort.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/16.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class InsertSort: SortProtocol {
    static func sort<T: ComparableElement>(data: [T]) -> [T] {
        var newList = data
        for index in 1..<data.count {
            let selectedElem = newList[index]
            var j = index
            while j > 0 && newList[j - 1] > selectedElem {
                newList[j] = newList[j - 1]
                j -= 1
            }
            newList[j] = selectedElem
        }
        return newList
    }
}
