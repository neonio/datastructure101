//
//  main.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
extension Int: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(self)"
    }
}

let tree = BSTSet<Int>()
tree.add(value: 20)
tree.add(value: 30)
tree.add(value: 20)
tree.add(value: 15)
print("\(tree.size)")
