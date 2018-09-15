//
//  RBTree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/15.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation

class RBTree<K: ComparableElement, V: ReadableElement> {
    class Node {
        var key: K
        var value: V
        var left: Node?
        var right: Node?
        var isRedColor: Bool = true
        init(key: K, value: V) {
            self.key = key
            self.value = value
        }
    }
    var root:Node?
    private(set) var size = 0
    
    func isRedNode(node:Node?) -> Bool {
        guard let node = node else { return false}
        return node.isRedColor
    }
    
   
    
    func add(key:K, value: V) {
        root = add(root: root, key: key, value: value)
    }
    
    func add(root:Node?, key:K, value:V) -> Node{
        if let root = root {
            if key < root.key {
                root.left = add(root: root.left, key: key, value: value)
            }else if key > root.key {
                root.right = add(root: root.right, key: key, value: value)
            }else{
                // 更新
                root.value = value
            }
            return root
        }else{
            size += 1
            return Node(key: key, value: value)
        }
    }
    
    func get(key:K) -> Node? {
        return get_iter(root: self.root, key: key)
    }
    
    func get_iter(root:Node?, key:K) -> Node?{
        if let root = root {
            if key == root.key {
                return root
            }else if key < root.key {
                return get_iter(root: root.left, key: key)
            }else{
                return get_iter(root: root.right, key: key)
            }
        }else{
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
    
    func contains(key: K) -> Bool {
        return get(key: key) != nil
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
            return retNode
        } else {
            return nil
        }
    }
}
