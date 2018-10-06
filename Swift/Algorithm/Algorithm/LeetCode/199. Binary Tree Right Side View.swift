//
//  199. Binary Tree Right Side View.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P199 {
    class Solution {
        func rightSideView(_ root: TreeNode?) -> [Int] {
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
            var result:[Int] = []
            for item in rst {
                if let lastItem = item.last {
                    result.append(lastItem)
                }
            }
            return result
        }
    }
}
