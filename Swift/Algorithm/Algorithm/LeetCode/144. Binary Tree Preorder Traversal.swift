//
//  144. Binary Tree Preorder Traversal.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P144 {
    class Solution {
        
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            return preorderTraversalIter(root, list: [])
        }
        
        func preorderTraversalIter(_ root: TreeNode?, list:[Int]) -> [Int] {
            var result = list
            guard let root = root else { return result }
            result.append(root.val)
            result = preorderTraversalIter(root.left, list: result)
            result = preorderTraversalIter(root.right, list: result)
            return result
        }
    }

}
