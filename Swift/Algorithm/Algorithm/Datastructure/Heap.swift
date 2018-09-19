//
//  Heap.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class Heap<T: ComparableElement>: CustomDebugStringConvertible {
    var debugDescription: String {
        return data.debugDescription
    }
    
    private(set) var data: [T] = []
    var size: Int {
        return data.count
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    init() {}
    
    func situSort() {
        // 由于我们是存储在数组里面的，这时候想要对数组排序的话
        for i in stride(from: size - 1, through: 1, by: -1) {
            data.swapAt(0, i)
            // 到当前处理的 heap max index 截止
            shiftDown(index: 0, until: i)
        }
    }
    
    func isValid(heapArray:[T]) -> Bool {
        for i in 0..<parentIndex(nodeIndex: (size - 1)) {
            let result = heapArray[i] < heapArray[leftChildIndex(nodeIndex: i)] || heapArray[i] < heapArray[rightChildindex(nodeIndex: i)]
            assert(!result, "error")
        }
        return true
    }
    
    convenience init(list: [T]) {
        self.init()
        self.data = list
        let lastNotLeafElementIndex = parentIndex(nodeIndex: list.count - 1)
        for i in 0...lastNotLeafElementIndex {
            shiftDown(index: lastNotLeafElementIndex - i, until: data.count)
        }
    }
    
    func parentIndex(nodeIndex: Int) -> Int {
        assert(nodeIndex > 0, "节点的值应该大于0")
        return (nodeIndex - 1) / 2
    }
    func leftChildIndex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 1
    }
    
    func rightChildindex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 2
    }
    
    func add(element: T) {
        data.append(element)
        shiftUp(index: data.count - 1)
    }
    
    func shiftUp(index: Int) {
        var currentIndex = index
        while currentIndex > 0 && data[parentIndex(nodeIndex: currentIndex)] < data[currentIndex] {
            data.swapAt(parentIndex(nodeIndex: currentIndex), currentIndex)
            currentIndex = parentIndex(nodeIndex: currentIndex)
        }
    }
    
    func findMax() -> T? {
        if data.isEmpty {
            return nil
        }
        return data[0]
    }
    
    func extractMax() -> T? {
        if let maxElement = findMax() {
            data.swapAt(0, data.count - 1)
            data.removeLast()
            shiftDown(index: 0, until: data.count)
            return maxElement
        } else {
            return nil
        }
    }
    
    func shiftDown(index: Int, until:Int) {
        var selectedIndex = index
        // 这个判断条件是当前 index 不是叶子节点
        while leftChildIndex(nodeIndex: selectedIndex) < until {
            let leftElementIndex = leftChildIndex(nodeIndex: selectedIndex)
            let rightElementIndex = leftElementIndex + 1
            var maxChildElementIndex = leftElementIndex
            // 这个判断条件是当前有右节点
            if rightElementIndex < until && data[rightElementIndex] > data[leftElementIndex] {
                maxChildElementIndex = rightElementIndex
            }
            if data[selectedIndex] >= data[maxChildElementIndex] {
                break
            }
            data.swapAt(maxChildElementIndex, selectedIndex)
            selectedIndex = maxChildElementIndex
        }
    }
    
    func replace(elem: T) -> T? {
        guard let maxElem = findMax() else {
            return nil
        }
        data[0] = elem
        shiftDown(index: 0, until: data.count)
        return maxElem
    }
    

}
