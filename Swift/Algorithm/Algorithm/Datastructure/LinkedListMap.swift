//
//  LinkedListMap.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class LinkedListMap<K: CustomDebugStringConvertible, V:CustomDebugStringConvertible>: CustomDebugStringConvertible{
    var dummyHead: Node<K,V> = Node(
    private(set) var size:Int = 0
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    
    func getNode(key:K) -> V{
        let currentSelectNode = dummyHead
    }
    
    var debugDescription: String{
        
        return ""
    }
    
    class Node<K:CustomDebugStringConvertible, V:CustomDebugStringConvertible>:CustomDebugStringConvertible {
        var key:K
        var value:V
        var next:Node<K,V>?
        init(key:K, value:V, next:Node<K,V>?){
            self.key = key
            self.value = value
            self.next = next
        }
        var debugDescription: String{
            return "[\(key.debugDescription):\(value.debugDescription)]"
        }
    }
}
