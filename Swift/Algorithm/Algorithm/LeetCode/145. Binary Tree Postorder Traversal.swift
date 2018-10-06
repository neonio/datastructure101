//
//  145. Binary Tree Postorder Traversal.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation

class P145 {
    class Solution {
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            return postOrderTraversalIter(root, list: [])
        }
        
        func postOrderTraversalIter(_ root: TreeNode?, list:[Int]) -> [Int] {
            var result = list
            guard let root = root else { return result }
            result = postOrderTraversalIter(root.left, list: result)
            result = postOrderTraversalIter(root.right, list: result)
            result.append(root.val)
            return result
        }
    }
}
