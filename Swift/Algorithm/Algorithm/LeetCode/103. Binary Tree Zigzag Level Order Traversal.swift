//
//  103. Binary Tree Zigzag Level Order Traversal.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P103 {
    class Solution {
        func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
            return zigzagLevelOrderIter(root, level: 0)
        }
        
        func zigzagLevelOrderIter(_ root: TreeNode?, level:Int) -> [[Int]] {
            guard let root = root else { return [] }
            var queue:[(TreeNode, Int)] = [(root, 0)]
            var rst = [[Int]]()
            while let topElem:(node:TreeNode, level: Int) = queue.first {
                if rst.count <= topElem.level {
                    rst.append([])
                }
                rst[topElem.level].append(topElem.node.val)
                if let leftNode = topElem.node.left {
                    queue.append((leftNode, topElem.level + 1))
                }
                if let rightNode = topElem.node.right {
                    queue.append((rightNode,  topElem.level + 1))
                }
                queue.removeFirst()
            }
            for (index, item) in rst.enumerated() {
                if index % 2 == 1 {
                    rst[index] = item.reversed()
                }
            }
            return rst
        }
    }
}
