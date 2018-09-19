//
//  BSearch.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/17.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class BSearch <T:ComparableElement>{
    static func search(list:[T], elem:T) -> Int {
        var l = 0
        var r = list.count - 1
        while l <= r {
            let mid = l + (r - l)/2
            if list[mid] == elem {
                return mid
            }
            if elem < list[mid] {
                r = mid - 1
            }else{
                l = mid + 1
            }
        }
        return -1
    }
}
