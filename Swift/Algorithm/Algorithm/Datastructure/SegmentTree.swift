//
//  SegmentTree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class SegmentTree<T:ComparableElement> :CustomDebugStringConvertible{
    var debugDescription: String {
        return data.debugDescription
    }
    
    var data:[T] = []
    var tree:[T] = []
    var size:Int {
        return data.count
    }
    var isEmpty:Bool {
        return data.count == 0
    }
    
    init(list:[T]) {
        self.data = Array(data)
        
    }
    
    func leftChildIndex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 1
    }
    
    func rightChildindex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 2
    }
    
    func get(index:Int) -> T?{
        guard index >= 0 && index < data.count else{
            return nil
        }
        return data[index]
    }
}
