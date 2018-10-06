//
//  107. Binary Tree Level Order Traversal II.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P107 {
    class Solution {
        
        
        func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
            var rst:[[Int]] = []
            func levelOrderBottomIter(_ root: TreeNode?, level: Int) {
                guard let root = root else { return }
                if level > rst.count {
                    rst.insert([], at: 0)
                }
                levelOrderBottomIter(root.left, level: level + 1)
                levelOrderBottomIter(root.right, level: level + 1)
                rst[rst.count - level - 1].append(root.val)
            }
            levelOrderBottomIter(root, level: 0)
            return rst
        }
    }
}
