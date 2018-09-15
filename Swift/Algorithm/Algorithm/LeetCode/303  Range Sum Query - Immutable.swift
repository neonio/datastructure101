//
//  303  Range Sum Query - Immutable.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
private class NumArray {
    var preCalculate:[Int] = []
    init(nums:[Int]) {
        guard nums.count > 0 else {
            return
        }
        for (index, item) in nums.enumerated() {
            if index == 0 {
                preCalculate.append(item)
                continue
            }
            preCalculate.append(preCalculate[index - 1] + item)
        }
        
    }
    
    func sumRange(i:Int, j:Int) -> Int{
        if i == 0 {
            return preCalculate[j]
        }
        return preCalculate[j] - preCalculate[i - 1]
    }
}
