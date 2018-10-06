//
//  167. Two Sum II - Input array is sorted.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P167{
    class Solution {
        func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
            var left = 0
            var right = numbers.count - 1
            while left < right {
                if numbers[left] + numbers[right] == target {
                    return [left + 1, right + 1]
                }else if numbers[left] + numbers[right] < target{
                    left += 1
                }else {
                    right -= 1
                }
            }
            return [-1, -1]
        }
        
        func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
            for (i, item) in numbers.enumerated() {
                let targetval = target - item
                let searchedIndex = search(target: targetval, orderList: Array(numbers[(i + 1)..<numbers.count]))
                if searchedIndex != -1 {
                    return [i + 1, searchedIndex + i + 1 + 1]
                }
            }
            return [-1, -1]
        }
        
        func search(target:Int, orderList:[Int]) -> Int {
            var lower = 0
            var higher = orderList.count - 1 // [lower, higher]
            while lower <= higher {
                let mid = lower + (higher - lower) / 2
                if orderList[mid] == target {
                    return mid
                }else if orderList[mid] > target {
                    higher = mid - 1
                }else{
                    lower = mid + 1
                }
            }
            return -1
        }
    }

}
