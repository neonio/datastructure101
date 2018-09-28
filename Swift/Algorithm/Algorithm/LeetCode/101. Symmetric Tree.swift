//
//  101. Symmetric Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
fileprivate class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


fileprivate class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return isSymmetricIter(root?.left, root?.right)
    }
    
    func isSymmetricIter(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil  {
            return true
        }
        
        if left == nil || right == nil {
            return false
        }
        guard let leftNodeVal = left?.val, let rightNodeVal = right?.val, leftNodeVal == rightNodeVal else {
            return false
        }
        return isSymmetricIter(left?.left, right?.right) && isSymmetricIter(left?.right, right?.left)
    }
}
