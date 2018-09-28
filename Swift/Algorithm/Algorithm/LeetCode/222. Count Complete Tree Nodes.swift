//
//  222. Count Complete Tree Nodes.swift
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
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return countNodes(root?.left) + countNodes(root?.right) + 1
    }
}
