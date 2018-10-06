//
//  108. Convert Sorted Array to Binary Search Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P108 {
    class Solution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            return build(nums, left: 0, right: nums.count)
        }
        
        func build(_ nums:[Int], left:Int, right: Int) -> TreeNode? {
            guard left < right else { return nil }
            let mid = left + (right - left) / 2
            let node = TreeNode(nums[mid])
            node.left = build(nums, left: left, right: mid)
            node.right = build(nums, left: mid + 1, right: right)
            return node
        }
    }
}
