//
//  279. Perfect Squares.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/6.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
// Dynamic Programming
class P279 {
    struct Path {
        let remain: Int
        let step: Int
    }

    class Solution {
        func numSquares(_ n: Int) -> Int {
            var queue: [Path] = []
            var visited: [Bool] = [Bool](repeating: false, count: n + 1)
            queue.append(Path(remain: n, step: 0))
            visited[n] = true
            while let top: Path = queue.first {
                guard top.remain != 0 else {
                    return top.step
                }
                queue.removeFirst()
                if top.remain == 0 {
                    return top.step
                }
                var i = 1
                var diff: Int = top.remain - i * i
                repeat {
                    if !visited[diff] {
                        queue.append(Path(remain: diff, step: top.step + 1))
                        visited[diff] = true
                    }
                    i += 1
                    diff = top.remain - i * i
                } while diff >= 0
            }
            return -1
        }
    }
}
