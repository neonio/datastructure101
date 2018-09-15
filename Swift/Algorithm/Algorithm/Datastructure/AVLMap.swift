//
//  AVLMap.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/15.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class AVLMap<K: ComparableElement, V: ReadableElement> {
    var avl: AVLTree<K, V> = AVLTree<K, V>()
    func add(key: K, value: V) {
        avl.add(key: key, value: value)
    }
    
    func contains(key: K) -> Bool {
        return avl.get(key: key) != nil
    }
    
    func get(key: K) -> V? {
        return avl.get(key: key)?.value
    }
}
