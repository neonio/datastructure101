//
//  main.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/5.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyHead:ListNode? = ListNode(-1)
        dummyHead?.next = head
        var selected_node = dummyHead
        while let selected_node_nt = selected_node?.next {
            if selected_node_nt.val == val {
                selected_node?.next = selected_node_nt.next
            }else{
                selected_node = selected_node_nt.next
            }
        }
        return dummyHead?.next
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(6)
head.next?.next?.next = ListNode(3)
head.next?.next?.next?.next = ListNode(6)


let result = Solution().removeElements(head, 6)
print("\(result)")

