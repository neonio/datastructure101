//
//  MergeSort.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/16.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class MergeSort{
    static func merge<T:ComparableElement>(list:[T]) ->[T] {
        guard list.count > 1 else {return list}
        let mid = list.count/2
        let leftArray = merge(list: Array(list[0..<mid]))
        let rightArray = merge(list: Array(list[mid..<list.count]))
        assert(list.count == (leftArray.count + rightArray.count), "error")
        return merge(leftList: leftArray, rightList: rightArray)
    }
    //0.010256814956665038
    //0.008931398391723633
    
    static func merge<T:ComparableElement>(leftList:[T], rightList:[T]) -> [T] {
        //0.010256814956665038 -> 0.008931398391723633
        if let leftLastElem = leftList.last , let rightFirstElem = rightList.first {
            if leftLastElem < rightFirstElem {
                return leftList + rightList
            }
        }else if leftList.isEmpty {
            return rightList
        }else if rightList.isEmpty {
            return leftList
        }
        //0.008543801307678223 -> 0.008231210708618163
        if leftList.count + rightList.count < 15 {
            let newLeftList = InsertSort.sort(data: leftList + rightList)
            return newLeftList
        }
        var orderedList:[T] = []
        var leftIndex = 0
        var rightIndex = 0
        if orderedList.capacity < leftList.count + rightList.count {
            orderedList.reserveCapacity(leftList.count + rightList.count)
        }
        while true {
            // 左边的已经计数完成
            guard leftIndex < leftList.endIndex else {
                orderedList.append(contentsOf: rightList[rightIndex..<rightList.endIndex])
                break
            }
            guard rightIndex < rightList.endIndex else {
                orderedList.append(contentsOf: leftList[leftIndex..<leftList.endIndex])
                break
            }
            if leftList[leftIndex] < rightList[rightIndex] {
                orderedList.append(leftList[leftIndex])
                leftIndex += 1
            }else{
                orderedList.append(rightList[rightIndex])
                rightIndex += 1
            }
        }
        
        return orderedList
    }
    
    static func mergeBottomUp<T:ComparableElement>(list:[T]) -> [T]{
        var newList = list
        var initSize = 1
        while initSize <= list.count {
            var index = 0
            while index + initSize < list.count {
                newList = MergeSort.merge(list: Array(list[(index + initSize - 1)..<(min(list.count-1,index + initSize * 2 - 1))]))
                index += initSize * 2
            }
            
            initSize += initSize
        }
        return newList
    }
}
