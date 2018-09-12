//
//  LinkedList.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/11.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation

class LinkedList<NodeType: CustomDebugStringConvertible & Equatable>: CustomDebugStringConvertible {
    class Node<T: CustomDebugStringConvertible>: CustomDebugStringConvertible {
        var value: T?
        var next: Node<T>?
        
        init(value: T, next: Node?) {
            self.value = value
            self.next = next
        }
        
        init() {}
        
        convenience init(_ value: T) {
            self.init()
            self.value = value
        }
        
        var debugDescription: String {
            guard let valueString = self.value else { return "Empty" }
            return "[\(valueString.debugDescription)]->\(next == nil ? "None" : "")"
        }
    }
    
    var dummyHead: Node<NodeType>
    private(set) var size: Int = 0
    init() {
        self.dummyHead = LinkedList.Node<NodeType>()
        self.size = 0
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func add(index: Int, value: NodeType) -> Bool {
        guard index >= 0 && index <= size else {
            return false
        }
        var preNode: Node? = dummyHead
        for _ in 0..<index {
            preNode = preNode?.next
        }
        preNode?.next = Node(value: value, next: preNode?.next)
        size += 1
        return true
    }
    
    func addFirst(value: NodeType) -> Bool {
        return add(index: 0, value: value)
    }
    
    func addLast(value: NodeType) -> Bool {
        return add(index: self.size, value: value)
    }
    
    func object(at index: Int) -> Node<NodeType>? {
        guard index >= 0 && index < size else {
            return nil
        }
        var selectNode: Node? = dummyHead
        for _ in 0...index {
            selectNode = selectNode?.next
        }
        return selectNode
    }
    
    func getFirst() -> Node<NodeType>? {
        return object(at: 0)
    }
    
    func getLast() -> Node<NodeType>? {
        return object(at: size - 1)
    }
    
    func contains(value: NodeType) -> Bool {
        var selectedNode = self.dummyHead.next
        while let cNode = selectedNode {
            if cNode.value == value {
                return true
            }
            selectedNode = cNode.next
        }
        return false
    }
    
    func update(value: NodeType, index: Int) -> Bool {
        guard index >= 0 && index < size else {
            return false
        }
        var selectedNode: Node? = dummyHead
        for _ in 0...index {
            selectedNode = selectedNode?.next
        }
        selectedNode?.value = value
        return true
    }
    
    func remove(at index: Int) -> Node<NodeType>? {
        guard index >= 0 && index < size else {
            return nil
        }
        var preNode: Node? = dummyHead
        for _ in 0..<index {
            preNode = preNode?.next
        }
        let node = preNode?.next
        preNode?.next = node?.next
        node?.next = nil
        self.size -= 1
        return node
    }
    
    func removeFirst() -> Node<NodeType>? {
        return self.remove(at: 0)
    }
    
    func removeLast() -> Node<NodeType>? {
        return self.remove(at: self.size - 1)
    }
    
    func removeValue(value: NodeType) -> Bool {
        var selectNode: Node? = dummyHead
        while let preNode = selectNode, let node = preNode.next {
            if node.value! == value {
                preNode.next = node.next
                return true
            }
            selectNode = node
        }
        return false
    }
    
    var debugDescription: String {
        var selectNode: Node? = dummyHead
        var displayStr = "HEAD->"
        while selectNode?.next != nil {
            displayStr += "[\(String(describing: selectNode?.next!.value))]"
            selectNode = selectNode?.next
        }
        return displayStr
    }
}
