//
//  100. Same Tree.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/28.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation


class P100 {
    class Solution {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if (p != nil && q == nil) || (p == nil && q != nil) || (p?.val != q?.val){
                return false
            }
            
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }

}
