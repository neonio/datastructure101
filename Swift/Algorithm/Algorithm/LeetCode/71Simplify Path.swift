//
//  71Simplify Path.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func simplifyPath(_ path: String) -> String {
        let path_comps = path.split(separator: "/")
        var stack = Stack<String>()
        for item in path_comps{
            switch item {
            case ".","":
                continue
            case "..":
                if !stack.isEmpty() {
                    stack.pop()
                }
            default:
                stack.push(elem: String(item))
            }
        }
        var result = ""
        while let str = stack.pop() {
            result = str + "/" + result
        }
        result = "/" + result
        return result
    }
}
