//
//  LinkedListSet.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/11.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class LinkedListSet<NodeType: CustomDebugStringConvertible & Equatable>:CustomDebugStringConvertible {
    var debugDescription: String {
        return linkedlist.debugDescription
    }
    
    var size: Int {
        return linkedlist.size
    }
    
    func isEmpty() -> Bool {
        return linkedlist.isEmpty()
    }
    private var linkedlist: LinkedList<NodeType> = LinkedList<NodeType>()
    
    func contains(value: NodeType) -> Bool{
        return linkedlist.contains(value: value)
    }
    func add(value: NodeType) -> Bool{
        if !contains(value: value) {
            return linkedlist.addFirst(value: value)
        }
        return false
    }
    func removeValue(value: NodeType) -> Bool{
        return linkedlist.removeValue(value: value)
    }
}
