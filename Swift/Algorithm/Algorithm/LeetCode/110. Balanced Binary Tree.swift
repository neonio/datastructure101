//
//  110. Balanced Binary Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P110 {
    class Solution {
        func isBalanced(_ root: TreeNode?) -> Bool {
            if let root = root {
                if abs(getDepth(for: root.left) - getDepth(for: root.right)) > 1 {
                    return false
                } else {
                    return isBalanced(root.left) && isBalanced(root.right)
                }
            } else {
                return true
            }
        }
        
        func getDepth(for node: TreeNode?) -> Int {
            if node == nil {
                return 0
            } else {
                return max(getDepth(for: node?.left), getDepth(for: node?.right)) + 1
            }
        }
    }
}
