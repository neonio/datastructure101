//
//  Utils.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation

public enum FoundationError: Error{
    case overflow
    case dividzero
    case cannotfindkey
}

public protocol Testable {
    static func valid() -> Bool
    func testcase() -> [Bool]
}

