//
//  102. Binary Tree Level Order Traversal.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/29.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation

class P102 {
    class Solution {
        func levelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else { return [] }
            var rst: [[Int]] = []
            var queue: [(TreeNode, Int)] = [(root, 0)]
            while let elem: (node: TreeNode, index: Int) = queue.first {
                if rst.count <= elem.index {
                    rst.append([])
                }
                rst[elem.index].append(elem.node.val)
                if let leftNode = elem.node.left {
                    queue.append((leftNode, elem.index + 1))
                }
                if let rightNode = elem.node.right {
                    queue.append((rightNode, elem.index + 1))
                }
                queue.removeFirst()
            }
            return rst
        }
    }
}
