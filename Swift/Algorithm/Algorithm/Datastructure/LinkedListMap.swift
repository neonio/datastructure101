//
//  LinkedListMap.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
typealias ComparableElement = CustomDebugStringConvertible&Comparable
typealias EquableElement = CustomDebugStringConvertible&Equatable
typealias ReadableElement = CustomDebugStringConvertible
typealias HashableElement = CustomDebugStringConvertible&Hashable
class LinkedListMap<K: EquableElement, V:ReadableElement>: ReadableElement {
    var dummyHead: Node<K,V> = Node(key: nil, value:nil, next: nil)
    private(set) var size:Int = 0

    func isEmpty() -> Bool{
        return size == 0
    }

    func contains(key:K) -> Bool {
        return getNode(key: key) != nil
    }
    
    func get(key:K) -> V? {
        return getNode(key: key)?.value
    }
    
    func add(key: K, value: V) -> Void {
        let node = getNode(key: key)
        if node == nil {
            dummyHead.next = Node(key: key, value: value, next: dummyHead.next)
            size += 1
        }else{
            node?.value = value
        }
    }
    
    func set(key: K, value: V) throws {
        if let node = getNode(key: key) {
            node.value = value
        }else{
            throw FoundationError.cannotfindkey
        }
    }
    
    func remove(key: K) -> V? {
        var preNode:Node? = dummyHead
        while let currentNode = preNode?.next {
            if currentNode.key == key {
                let deleteNode = currentNode
                preNode?.next = currentNode.next
                deleteNode.next = nil
                size -= 1
                return deleteNode.value
            }
            preNode = preNode?.next
        }
        return nil
    }
    
    // 优先实现方法
    func getNode(key: K) -> Node<K, V>?{
        var selectedNode:Node? = self.dummyHead
        while let cNode = selectedNode {
            if cNode.key == key {
                return cNode
            }
            selectedNode = cNode.next
        }
        return nil
    }
    

    var debugDescription: String{
        var selectNode:Node? = dummyHead
        var displayStr = "Map:"
        while let cNode = selectNode?.next {
            let keyDesc = cNode.key!.debugDescription
            let valueDesc = cNode.value!.debugDescription
            displayStr += "(\(keyDesc),\(valueDesc)) "
            selectNode = cNode
        }
        return displayStr
    }

    class Node<K:CustomDebugStringConvertible, V:CustomDebugStringConvertible>:CustomDebugStringConvertible {
        var key:K?
        var value:V?
        var next:Node<K,V>?
        init(key:K?, value:V?, next:Node<K,V>?){
            self.key = key
            self.value = value
            self.next = next
        }
        var debugDescription: String{
            return "[\(key.debugDescription):\(value.debugDescription)]"
        }
    }
    
}
