//
//  226. Invert Binary Tree.swift
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let root = root {
            _ = invertTree(root.left)
            _ = invertTree(root.right)
            swap(&root.left, &root.right)
            return root
        }else{
            return nil
        }
    }
}
