//
//  86Partition List.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/6.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummyNode = ListNode(-1)
        dummyNode.next = head
        var currentNode = dummyNode
        let frontNodeDummy:ListNode = ListNode(-1)
        var frontList: ListNode = frontNodeDummy
        let tailNodeDummy: ListNode = ListNode(-1)
        var tailList:ListNode = tailNodeDummy
        
        while currentNode.next != nil {
            guard let nextNodeVal = currentNode.next?.val else {
                return nil
            }
            if nextNodeVal < x {
                let nextFrontNode = ListNode(nextNodeVal)
                frontList.next = nextFrontNode
                frontList = frontList.next!
            }else{
                let nextTailNode = ListNode(nextNodeVal)
                tailList.next = nextTailNode
                tailList = tailList.next!
            }
            currentNode = currentNode.next!
        }
        var result: ListNode?
        if frontNodeDummy.next != nil {
            result = frontNodeDummy.next
            frontList.next =  tailNodeDummy.next
        }else{
            result = tailNodeDummy.next
        }
        return result
    }
}
