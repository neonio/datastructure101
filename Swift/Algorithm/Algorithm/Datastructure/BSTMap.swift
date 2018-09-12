//
//  BSTMap.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class BSTMap<K: ComparableElement, V:ReadableElement>: ReadableElement {
    typealias Element = Node<K, V>
    var debugDescription: String {
        return ""
    }
    var root: Node<K, V>?
    private(set) var size = 0
    
    class Node<K:ComparableElement, V:ReadableElement>:ReadableElement {
        var key:K?
        var value:V?
        var left: Node<K,V>?
        var right: Node<K,V>?
        init(key:K?, value:V?){
            self.key = key
            self.value = value
        }
        var debugDescription: String{
            return "[\(key.debugDescription):\(value.debugDescription)]"
        }
    }
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    func add(key: K, value: V) -> Element{
        return add(root: root, key: key, value: value)
    }
    
    func add(root:Element?, key: K, value:V) -> Element{
        if let notNilRoot = root {
            if key < notNilRoot.key! {
                notNilRoot.left = add(root: notNilRoot.left, key: key, value: value)
            }else if key > notNilRoot.key! {
                notNilRoot.right = add(root: notNilRoot.right, key: key, value: value)
            }else{
                notNilRoot.value = value
            }
            return notNilRoot
        }else{
            return Node(key: key, value: value)
        }
    }
    
    func getNode(key: K) -> Element? {
        return getNode(root: root, key: key)
    }
    
    func getNode(root: Element?, key:K) -> Element? {
        if let nRoot = root {
            if nRoot.key! == key {
                return nRoot
            }else if key < nRoot.key! {
                return getNode(root: nRoot.left, key: key)
            }else {
                return getNode(root: nRoot.right, key: key)
            }
        }else{
            return nil
        }
    }
    
    func contains(key: K) -> Bool {
        return getNode(key: key) != nil
    }
    
    func get(key: K) -> V? {
        return getNode(key: key)?.value
    }
    
    func set(key:K, value: V) throws {
        if let cNode = getNode(key: key) {
            cNode.value = value
        }else{
            throw FoundationError.cannotfindkey
        }
    }
    
    @discardableResult
    func removeMin() -> Element? {
        let minNode = getMin()
        root = removeMin(rootNode: root)
        return minNode
    }
    
    func getMin() -> Element? {
        return getMin(rootNode: root)
    }
    
    func getMin(rootNode: Element?) -> Element? {
        if let rootNodeL = rootNode?.left {
            return getMin(rootNode: rootNodeL)
        }else{
            return rootNode
        }
    }
    
    private func removeMin(rootNode: Element?) -> Element? {
        if rootNode?.left == nil {
            let rootNodeR = rootNode?.right
            rootNode?.right = nil
            size -= 1
            return rootNodeR
        }
        rootNode?.left = removeMin(rootNode:rootNode?.left)
        return rootNode
    }
    
    func remove(key: K) -> Element?{
        return remove(root: root, key: key)
    }
    
    func remove(root:Element?, key: K) -> Element?{
        if let node = getNode(key: key) {
            if key < node.key!{
                return remove(root: node.left, key: key)
            }else if key > node.key!{
                return remove(root: node.right, key: key)
            }else{
                // One child node
                if node.left == nil {
                    let rightNode = node.right
                    node.right = nil
                    size -= 1
                    return rightNode
                }
                
                if node.right == nil {
                    let leftNode = node.left
                    node.left = nil
                    size -= 1
                    return leftNode
                }
                
                let minInRightTree = getMin(rootNode: node.right)
                minInRightTree?.right = removeMin(rootNode: node.right)
                minInRightTree?.left = node.left
                node.left = nil
                node.right = nil
                return minInRightTree
            }
        }else{
            return nil
        }
    }
}
