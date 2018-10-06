//
//  257. Binary Tree Paths.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P257 {
    class Solution {
        func binaryTreePaths(_ root: TreeNode?) -> [String] {
            if root == nil {
                return []
            }
            
            if root?.left == nil && root?.right == nil {
                return ["\(root!.val)"]
            }
            
            let leftStringList = binaryTreePaths(root?.left).map { (str) -> String in
                return "\(root!.val)->\(str)"
            }
            let rightStringList = binaryTreePaths(root?.right).map { (str) -> String in
                return "\(root!.val)->\(str)"
            }
            return leftStringList + rightStringList
        }
    }
}
