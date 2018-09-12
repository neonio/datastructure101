//
//  main.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
extension Int: CustomDebugStringConvertible  {
    public var debugDescription: String {
        return "\(self)"
    }
}


let a = Heap<Int>(list: [3,1,3,2,2])


//for item in 0...100 {
//    a.add(element: Int.random(in: 0...100))
//}

print(a.extractMax())

print(a.extractMax())

print(a.extractMax())

