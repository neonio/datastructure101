//
//  203Remove Linked List Elements.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
       self.val = val
       self.next = nil
    }
}

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
fileprivate class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummaryHead = ListNode(-1)
        dummaryHead.next = head
        var selected_node:ListNode? = dummaryHead
        while selected_node?.next != nil {
            if selected_node?.next?.val == val {
                let matchedNode = selected_node?.next
                selected_node?.next = selected_node?.next?.next
                matchedNode?.next = nil
                continue
            }
            selected_node = selected_node?.next
        }
        return dummaryHead.next
    }
}
//WARNING: LeetCode 编译器有问题， 这个无法通过


