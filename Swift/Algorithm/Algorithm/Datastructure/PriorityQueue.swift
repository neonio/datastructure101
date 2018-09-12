//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class PriorityQueue<T: ComparableElement>{
    private var maxHeap:Heap<T> = Heap<T>()
    var size: Int{
        return maxHeap.size
    }
    var isEmpty:Bool {
        return maxHeap.isEmpty()
    }
    
    func enqueue(elem: T) {
        maxHeap.add(element: elem)
    }
    
    public func getHead() -> T? {
        return maxHeap.findMax()
    }
    
    @discardableResult
    func dequeue() -> T?{
        return maxHeap.extractMax()
    }
}
