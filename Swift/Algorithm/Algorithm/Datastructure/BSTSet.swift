//
//  BSTSet.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class BSTSet<NodeType: Comparable & CustomDebugStringConvertible> {

    func add(value: NodeType) {
        bst.addNode(value: value)
    }
    
    func remove(value: NodeType){
        bst.remove(value: value)
    }
    
    func contains(value: NodeType) -> Bool {
        return bst.contains(value: value)
    }
    
    func isEmpty() -> Bool {
        return bst.isEmpty()
    }
    
    var bst = BST<NodeType>()
    var size: Int {
        return bst.size
    }
    
}

