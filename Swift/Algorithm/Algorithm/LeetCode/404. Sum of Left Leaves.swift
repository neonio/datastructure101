//
//  404. Sum of Left Leaves.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P404 {
    class Solution {
        func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
                return (root?.left?.val ?? 0) + sumOfLeftLeaves(root?.right)
            } else {
                return sumOfLeftLeaves(root?.left) + sumOfLeftLeaves(root?.right)
            }
        }
    }
}
