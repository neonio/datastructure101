//
//  Union.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/15.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class UnionSet {
    var dataset: [Int] = []
    init(capacity: Int) {
        for i in 0...capacity {
            dataset.append(i)
        }
    }
    
    var size: Int {
        return dataset.count
    }
    
    
    /// 获取第 i 个元素所属的集合序号
    func find(index: Int) -> Int {
        guard index >= 0 && index < size else { return -1 }
        return dataset[index]
    }
    
    func isConnected(lIndex:Int, rIndex:Int) -> Bool {
        return dataset[lIndex] == dataset[rIndex]
    }
    
    func unionElements(lIndex:Int, rIndex:Int) {
        guard lIndex != rIndex else { return }
        let lSetID = dataset[lIndex]
        let rSetID = dataset[rIndex]
        if lSetID != rSetID {
            for i in 0...dataset.count {
                dataset[i] = lSetID
            }
        }
    }
}


class UnionFind {
    var parent:[Int] = []
    var rank:[Int] = []
    init(capacity: Int) {
        for i in 0...capacity {
            parent.append(i)
            rank.append(1)
        }
    }
    
    var size: Int {
        return parent.count
    }
    
    /// 获取第 i 个元素所属的集合序号
    func find(index:Int) -> Int {
        guard index >= 0 && index < size else { return -1 }
        var currentIndex = index
        while currentIndex != parent[currentIndex] {
            // 路径压缩
            parent[currentIndex] = parent[parent[currentIndex]]
            currentIndex = parent[currentIndex]
        }
        return currentIndex
    }
    
    func isConnected(lIndex:Int, rIndex:Int) -> Bool {
        return parent[lIndex] == parent[rIndex]
    }
    
    func unionElements(lIndex:Int, rIndex:Int) {
        let lIndexID = find(index: lIndex)
        let rIndexID = find(index: rIndex)
        if lIndexID == rIndexID {
            return
        }
        
        if rank[lIndexID] < rank[rIndexID] {
            parent[lIndexID] = rIndexID
        }else if rank[lIndexID] > rank[rIndexID] {
            parent[rIndexID] = lIndexID
        }else{
            parent[lIndexID] = rIndexID
            rank[rIndexID] += 1
        }
    }
}
