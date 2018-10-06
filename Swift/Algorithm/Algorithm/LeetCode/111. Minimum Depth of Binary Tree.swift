//
//  111. Minimum Depth of Binary Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P111 {
    class Solution {
        func minDepth(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            
            if root?.left == nil {
                return minDepth(root?.right) + 1
            }
            
            if root?.right == nil {
                return minDepth(root?.left) + 1
            }
            
            return min(minDepth(root?.left), minDepth(root?.right)) + 1
        }
    }
}
