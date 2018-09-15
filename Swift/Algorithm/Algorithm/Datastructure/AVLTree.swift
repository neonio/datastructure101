//
//  AVLTree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/15.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class AVLTree<K: ComparableElement, V: ReadableElement> {
    class Node {
        var key: K
        var value: V
        var left: Node?
        var right: Node?
        var height: Int = 1
        init(key: K, value: V) {
            self.key = key
            self.value = value
        }
    }
    
    var root: Node?
    private(set) var size = 0
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func getHeight(node: Node?) -> Int {
        return node?.height ?? 0
    }
    
    func getBalanceFactor(node: Node?) -> Int {
        return getHeight(node: node?.left) - getHeight(node: node?.right)
    }
    
    func add(key: K, value: V) {
        root = addIter(root: self.root, key: key, value: value)
    }
    
    func addIter(root: Node?, key: K, value: V) -> Node? {
        if let root = root {
            if key < root.key {
                return addIter(root: root.left, key: key, value: value)
            } else if key > root.key {
                return addIter(root: root.right, key: key, value: value)
            }
            root.height = max(getHeight(node: root.left), getHeight(node: root.right)) + 1
            let balanceFactor = getBalanceFactor(node: root)
            // LL
            if balanceFactor > 1 && getBalanceFactor(node: root.left) >= 0 {
                return rightRotate(unbalanceNode: root)
            }
            
            // RR
            if balanceFactor < -1 && getBalanceFactor(node: root.right) <= 0 {
                return leftRotate(unbalanceNode: root)
            }
            
            // LR
            if balanceFactor > 1 && getBalanceFactor(node: root.left) < 0 {
                root.right = leftRotate(unbalanceNode: root.left)
                return rightRotate(unbalanceNode: root)
            }
            
            // RL
            if balanceFactor < -1 && getBalanceFactor(node: root.right) > 0 {
                root.left = rightRotate(unbalanceNode: root.right)
                return leftRotate(unbalanceNode: root)
            }
            return root
        } else {
            size += 1
            return Node(key: key, value: value)
        }
    }
    
    func isBalanced() -> Bool {
        return isBalancedIter(root: self.root)
    }
    
    func isBalancedIter(root: Node?) -> Bool {
        if let root = root {
            if abs(getBalanceFactor(node: root)) > 1 {
                return false
            } else {
                return isBalancedIter(root: root.left) && isBalancedIter(root: root.right)
            }
        } else {
            return true
        }
    }
    
    func rightRotate(unbalanceNode:Node?) -> Node? {
        let leftNode = unbalanceNode?.left
        let leftNodeRightChildNode = leftNode?.right
        leftNode?.right = unbalanceNode
        unbalanceNode?.left = leftNodeRightChildNode
        unbalanceNode?.height = max(getHeight(node: unbalanceNode?.left), getHeight(node: unbalanceNode?.right))
        leftNode?.height = max(getHeight(node: leftNode?.left), getHeight(node: leftNode?.right))
        return leftNode
    }
    
    func leftRotate(unbalanceNode:Node?) -> Node? {
        let rightNode = unbalanceNode?.right
        let rightNodeleftChildNode = rightNode?.left
        rightNode?.left = unbalanceNode
        unbalanceNode?.right = rightNodeleftChildNode
        unbalanceNode?.height = max(getHeight(node: unbalanceNode?.left), getHeight(node: unbalanceNode?.right))
        rightNode?.height = max(getHeight(node: rightNode?.left), getHeight(node: rightNode?.right))
        return rightNode
    }
    
    func isBST() -> Bool {
        var list: [K] = []
        inOrder(root: self.root, keys: &list)
        for i in 1...list.count {
            if list[i - 1] > list[i] {
                return false
            }
        }
        return true
    }
    
    func inOrder(root: Node?, keys: inout [K]) {
        if let root = root {
            inOrder(root: root.left, keys: &keys)
            keys.append(root.key)
            inOrder(root: root.right, keys: &keys)
        } else {
            return
        }
    }
    
    func get(key: K) -> Node? {
        return getIter(root: self.root, key: key)
    }
    
    func getIter(root: Node?, key: K) -> Node? {
        if let root = root {
            if key < root.key {
                return getIter(root: root.left, key: key)
            } else if key > root.key {
                return getIter(root: root.right, key: key)
            }
            return root
        } else {
            return nil
        }
    }
    
    func set(key: K, newValue: V) {
        if let node = get(key: key) {
            node.value = newValue
        }
    }
    
    func minimum(root: Node?) -> Node? {
        if let leftNode = root?.left {
            return minimum(root: leftNode)
        } else {
            return root
        }
    }
    
    func removeMin(root: Node?) -> Node? {
        if let leftNode = root?.left {
            root?.left = removeMin(root: leftNode)
            return root
        } else {
            let rightNode = root?.right
            root?.right = nil
            size -= 1
            return rightNode
        }
    }
    
    func remove(key: K) -> Node? {
        if let removeNode = self.get(key: key) {
            removeIter(root: removeNode, key: key)
            return removeNode
        } else {
            return nil
        }
    }
    
    @discardableResult
    
    /// 这个方法主要用来重新整理移除节点之后的 Tree
    ///
    /// - Parameters:
    ///   - root: 传入的根节点
    ///   - key: 想删除的键
    /// - Returns: 执行好删除操作之后的根节点
    func removeIter(root: Node?, key: K) -> Node? {
        var retNode: Node?
        if let root = root {
            if key < root.key {
                root.left = removeIter(root: root.left, key: key)
                retNode = root
            } else if key > root.key {
                root.right = removeIter(root: root.right, key: key)
                retNode = root
            } else {
                if root.left == nil {
                    let rightNode = root.right
                    root.right = nil
                    size -= 1
                    // root 被删掉了，返回 right 节点
                    retNode = rightNode
                }
                
                if root.right == nil {
                    let leftNode = root.left
                    root.left = nil
                    size -= 1
                    // root 被删掉了，返回 left 节点
                    retNode = leftNode
                }
                
                // 节点均不为空的情况
                let successer = minimum(root: root.right)
                successer?.left = root.left
                successer?.right = removeMin(root: root.right)
                retNode = successer
            }
            // 处理平衡
            if retNode == nil {
                return nil
            }else{
                retNode?.height = max(getHeight(node: retNode?.left), getHeight(node: retNode?.right)) + 1
                let balanceFactor = getBalanceFactor(node: retNode)
                // LL
                if balanceFactor > 1 && getBalanceFactor(node: retNode?.left) >= 0 {
                    return rightRotate(unbalanceNode: retNode)
                }
                
                // RR
                if balanceFactor < -1 && getBalanceFactor(node: retNode?.right) <= 0 {
                    return leftRotate(unbalanceNode: retNode)
                }
                
                // LR
                if balanceFactor > 1 && getBalanceFactor(node: retNode?.left) < 0 {
                    retNode?.right = leftRotate(unbalanceNode: retNode?.left)
                    return rightRotate(unbalanceNode: retNode)
                }
                
                // RL
                if balanceFactor < -1 && getBalanceFactor(node: retNode?.right) > 0 {
                    retNode?.left = rightRotate(unbalanceNode: retNode?.right)
                    return leftRotate(unbalanceNode: retNode)
                }
                return retNode
            }
        } else {
            return nil
        }
    }
}
