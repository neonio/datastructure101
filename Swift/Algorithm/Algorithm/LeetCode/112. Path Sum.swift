//
//  112. Path Sum.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation



class P112 {
    class Solution {
        func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
            if root == nil { return false }
            if root?.left == nil && root?.right == nil {
                return root!.val == sum
            }
            return hasPathSum(root?.left, sum - (root?.val ?? 0)) || hasPathSum(root?.right, sum - (root?.val ?? 0))
        }
    }
}
