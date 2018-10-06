//
//  94. Binary Tree Inorder Traversal.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P94{
    class Solution {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            return inorderTraversalIter(root, list: [])
        }
        
        func inorderTraversalIter(_ root: TreeNode?, list:[Int]) -> [Int] {
            var result = list
            guard let root = root else { return result }
            result = inorderTraversalIter(root.left, list: result)
            result.append(root.val)
            result = inorderTraversalIter(root.right, list: result)
            return result
        }
    }

}
