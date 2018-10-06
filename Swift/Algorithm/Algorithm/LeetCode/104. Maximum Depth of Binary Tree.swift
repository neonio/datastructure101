//
//  104. Maximum Depth of Binary Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P104 {
    class Solution {
        func maxDepth(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
        }
    }
}
