//
//  PreDefinedTree.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class TreeNode : Equatable{
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    
    func toList() -> [Int?] {
        var queue:Queue<TreeNode?> = Queue<TreeNode?>()
        queue.enqueue(elem: self)
        var rst:[Int?] = []
        while let top = queue.dequeue() {
            rst.append(top?.val)
            if let leftNode = top?.left {
                queue.enqueue(elem: leftNode)
            }
            if let rightNode = top?.right {
                queue.enqueue(elem: rightNode)
            }
        }
        return rst
    }
}
