//
//  SegmentTree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class SegmentTree<T: ComparableElement>: CustomDebugStringConvertible {
    var debugDescription: String {
        return data.debugDescription
    }
    
    var data: [T] = []
    var tree: [T] = []
    private var mergeNodeBlock: ((T, T) -> T)
    var size: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.count == 0
    }
    
    init(list: [T], mergeOperation: @escaping ((T, T) -> T)) {
        assert(list.count > 0, "invalid list")
        self.data = Array(list)
        self.tree = [T](repeating: list.first!, count: list.count * 4)
        self.mergeNodeBlock = mergeOperation
        buildTree(index: 0, leftRange: 0, rightRange: data.count - 1)
    }
    
    private func buildTree(index: Int, leftRange: Int, rightRange: Int) {
        // 结束条件
        if leftRange == rightRange {
            tree[index] = data[leftRange]
            return
        }
        // 为了避免整形溢出
        let midPoint = leftRange + (rightRange - leftRange) / 2
        let leftElemIndex = leftChildIndex(nodeIndex: index)
        let rightElemIndex = rightChildindex(nodeIndex: index)
        buildTree(index: leftElemIndex, leftRange: leftRange, rightRange: midPoint)
        buildTree(index: rightElemIndex, leftRange: midPoint + 1, rightRange: rightRange)
        tree[index] = mergeNodeBlock(tree[leftElemIndex], tree[rightElemIndex])
    }
    
    func query(lRange: Int, rRange: Int) -> T {
        return query(rootTreeIndex: 0, baseLRange: 0, baseRRange: data.count - 1, queryLeftRange: lRange, queryRightRange: rRange)
    }
    
    func query(rootTreeIndex: Int, baseLRange: Int, baseRRange: Int, queryLeftRange: Int, queryRightRange: Int) -> T {
        if baseLRange == queryLeftRange && baseRRange == queryRightRange {
            return tree[rootTreeIndex]
        }
        let midPoint = baseLRange + (baseRRange - baseLRange) / 2
        let lChildTreeIndex = leftChildIndex(nodeIndex: rootTreeIndex)
        let rChildTreeIndex = rightChildindex(nodeIndex: rootTreeIndex)
        
        if queryRightRange <= midPoint {
            return query(rootTreeIndex: lChildTreeIndex, baseLRange: baseLRange, baseRRange: midPoint, queryLeftRange: queryLeftRange, queryRightRange: queryRightRange)
        } else if queryLeftRange > midPoint + 1 {
            return query(rootTreeIndex: rChildTreeIndex, baseLRange: midPoint + 1, baseRRange: baseRRange, queryLeftRange: queryLeftRange, queryRightRange: queryRightRange)
        }
        
        let leftElemTree = query(rootTreeIndex: lChildTreeIndex, baseLRange: baseLRange, baseRRange: midPoint, queryLeftRange: queryLeftRange, queryRightRange: midPoint)
        let rightElemTree = query(rootTreeIndex: rChildTreeIndex, baseLRange: midPoint + 1, baseRRange: baseRRange, queryLeftRange: midPoint + 1, queryRightRange: queryRightRange)
        return mergeNodeBlock(leftElemTree, rightElemTree)
    }
    
    func leftChildIndex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 1
    }
    
    func rightChildindex(nodeIndex: Int) -> Int {
        return nodeIndex * 2 + 2
    }
    
    func get(index: Int) -> T? {
        guard index >= 0 && index < data.count else {
            return nil
        }
        return data[index]
    }
    
    func update(index:Int, value: T) {
        guard index >= 0 && index < size else {
            return
        }
        data[index] = value
        updateTree(treeRootIndex: 0, dataIndex: index, value: value, lRange: 0, rRange: size - 1)
    }
    
    func updateTree(treeRootIndex:Int, dataIndex:Int, value:T, lRange:Int, rRange:Int) {
        if lRange == rRange {
            tree[treeRootIndex] = value
            return
        }
        
        let leftChildIndex = self.leftChildIndex(nodeIndex: treeRootIndex)
        let rightChildIndex = self.rightChildindex(nodeIndex: treeRootIndex)
        let mid = lRange + (rRange - lRange) / 2
        if dataIndex > mid {
            updateTree(treeRootIndex: rightChildIndex, dataIndex: dataIndex, value: value, lRange: mid + 1, rRange: rRange)
        }else {
            updateTree(treeRootIndex: leftChildIndex, dataIndex: dataIndex, value: value, lRange: lRange, rRange: mid)
        }
        tree[treeRootIndex] = mergeNodeBlock(tree[leftChildIndex], tree[rightChildIndex])
    }
}
