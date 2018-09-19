//
//  BST.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class BST<T: Comparable & CustomDebugStringConvertible>: CustomDebugStringConvertible {
    var debugDescription: String {
        return ""
    }
    
    var root: Node?
    var size: Int = 0
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func addNode(value: T) {
        root = add(rootNode: root, value: value)
    }
    
    // 返回新插入节点后二叉树的根
    private func add(rootNode: Node?, value: T) -> Node {
        if let rootNode = rootNode {
            if value < rootNode.data {
                rootNode.left = add(rootNode: rootNode.left, value: value)
            } else if value > rootNode.data {
                rootNode.right = add(rootNode: rootNode.right, value: value)
            }
            // if value == rootNode.data pass
            return rootNode
        } else {
            size += 1
            return Node(value)
        }
    }
    
    func contains(value: T) -> Bool {
        return contains(rootNode: root, value: value)
    }
    
    private func contains(rootNode: Node?, value: T) -> Bool {
        if let rootNode = rootNode {
            if value == rootNode.data {
                return true
            } else {
                if value < rootNode.data {
                    return contains(rootNode: rootNode.left, value: value)
                } else {
                    return contains(rootNode: rootNode.right, value: value)
                }
            }
        } else {
            return false
        }
    }
    
    func preOrder() {
        preOrder(rootNode: root)
    }
    
    private func preOrder(rootNode: Node?) {
        if let rootNode = rootNode {
            print(rootNode.data)
            preOrder(rootNode: rootNode.left)
            preOrder(rootNode: rootNode.right)
        }
    }
    
    // 非递归前序遍历
    func preOrderNR() {
        var temp = Stack<Node>()
        guard let root = root else {
            return
        }
        
        temp.push(elem: root)
        while !temp.isEmpty() {
            let topElem = temp.pop()
            print(topElem!.data)
            if let topElemR = topElem?.right {
                temp.push(elem: topElemR)
            }
            
            if let topElemL = topElem?.left {
                temp.push(elem: topElemL)
            }
        }
    }
    
    // 层序遍历
    func levelOrder() {
        guard let root = root else { return }
        var queue = Queue<Node>()
        queue.enqueue(elem: root)
        while !queue.isEmpty() {
            let headNode: Node = queue.dequeue()!
            if let leftNode = headNode.left {
                queue.enqueue(elem: leftNode)
            }
            if let rightNode = headNode.right {
                queue.enqueue(elem: rightNode)
            }
            print(headNode.debugDescription)
        }
    }
    
    
    // 前序遍历
    func getMin() -> Node? {
        if let root = root {
            return getMin(rootNode: root)
        } else {
            return nil
        }
    }
    
    func getMin(rootNode: Node) -> Node {
        if let rootNodeL = rootNode.left {
            return getMin(rootNode: rootNodeL)
        } else {
            return rootNode
        }
    }
    
    @discardableResult
    func removeMin() -> Node? {
        let minNode = getMin()
        root = removeMin(rootNode: root)
        return minNode
    }
    
    private func removeMin(rootNode: Node?) -> Node? {
        if rootNode?.left == nil {
            let rootNodeR = rootNode?.right
            rootNode?.right = nil
            size -= 1
            return rootNodeR
        }
        rootNode?.left = removeMin(rootNode: rootNode?.left)
        return rootNode
    }
    
    @discardableResult
    func removeMax() -> Node? {
        // get max 的作用是为了返回 remove 的值
        // 否则在下一步操作中 最大值会被设为 nil
        let maxNode = getMax()
        // 这里的递归是为了调整二叉树结构，在删除了最大值之后，最大值的左子树要调整到最大值的父节点，作为它的右子树
        root = removeMax(rootNode: root)
        
        return maxNode
    }
    
    // 用作调整树结构
    private func removeMax(rootNode: Node?) -> Node? {
        if rootNode?.right == nil {
            let leftNode = rootNode?.left
            rootNode?.left = nil
            size -= 1
            return leftNode
        }
        rootNode?.right = removeMax(rootNode: rootNode?.right)
        return rootNode
    }
    
    func getMax() -> Node? {
        if let root = root {
            return getMax(rootNode: root)
        } else {
            return nil
        }
    }
    
    func getMax(rootNode: Node) -> Node {
        if let rootNodeR = rootNode.right {
            return getMax(rootNode: rootNodeR)
        } else {
            return rootNode
        }
    }
    
    func remove(value: T) {
        root = remove(root: root, value: value)
    }
    
    private func remove(root: Node?, value: T) -> Node? {
        if let root = root {
            // 仅有一个节点
            if value > root.data {
                root.right = remove(root: root.right, value: value)
                return root
            } else if value < root.data {
                root.left = remove(root: root.left, value: value)
                return root
            } else {
                // value == root.data
                if root.left == nil {
                    let nodeR = root.right
                    root.right = nil
                    size -= 1
                    return nodeR
                }
                
                if root.right == nil {
                    let nodeL = root.left
                    root.left = nil
                    size -= 1
                    return nodeL
                }
                
                let minInRightTree = getMin(rootNode: root.right!)
                minInRightTree.right = removeMin(rootNode: root.right)
                minInRightTree.left = root.left
                
                root.right = nil
                root.left = nil
                
                return minInRightTree
            }
            
        } else {
            return nil
        }
    }
    
    class Node: Comparable, CustomDebugStringConvertible {
        var data: T
        var left: Node?
        var right: Node?
        
        static func < (lhs: BST<T>.Node, rhs: BST<T>.Node) -> Bool {
            return lhs.data < rhs.data
        }
        
        static func == (lhs: BST<T>.Node, rhs: BST<T>.Node) -> Bool {
            return lhs.data == rhs.data
        }
        
        var debugDescription: String {
            return "\(data.debugDescription) left-\(String(describing: left?.data)) right-\(String(describing: right?.data))"
        }
        
        init(value: T, left: Node?, right: Node?) {
            self.data = value
            self.left = left
            self.right = right
        }
        
        init(_ value: T) {
            self.data = value
        }
    }
}
