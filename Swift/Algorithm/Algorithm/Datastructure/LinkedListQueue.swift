//
//  LinkedList.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation



class LinkedListQueue<NodeType: CustomDebugStringConvertible>: CustomDebugStringConvertible {
    private(set) var size: Int = 0
    private var head:Node<NodeType>? = nil
    private var tail:Node<NodeType>? = nil
    
    var debugDescription: String{
        var currentNode = head
        var display_string = ""
        while currentNode != nil {
            display_string += "\(currentNode!.debugDescription)"
            currentNode = currentNode?.next
        }
        return "HEAD-> \(display_string)"
    }
    
    init() {
        self.size = 0
        self.head = nil
        self.tail = nil
    }
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    func dequeue() -> NodeType? {
        guard !isEmpty() else {
            return nil
        }
        var currentHeadNode = head
        head = head?.next
        let currentHeadNodeValue = currentHeadNode?.value
        currentHeadNode = nil
        
        // 下个节点可能是空的，这时候要把 tail 也设为 nil
        if head == nil {
            tail = nil
        }
        size -= 1
        return currentHeadNodeValue
    }
    
    func getFront() -> NodeType? {
        return head?.value
    }

    /// 从 tail 处入队
    func enqueue(nodeValue: NodeType) {
        if tail == nil {
            tail = Node(nodeValue)
            head = tail
        }else{
            tail?.next = Node(nodeValue)
            tail = tail?.next
        }
        
        size += 1
    }
    
    class Node<T: CustomDebugStringConvertible>: CustomDebugStringConvertible {
        var value: T?
        var next: Node<T>?
        
        init(value: T, next: Node) {
            self.value = value
            self.next = next
        }
        
        init() {}
        
        convenience init(_ value: T) {
            self.init()
            self.value = value
        }
        
        var debugDescription: String {
            guard let valueString = self.value else {return "Empty"}
            return "[\(valueString.debugDescription)]->\(next == nil ? "None" : "")"
        }
    }
    
}
