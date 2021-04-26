//
//  ListNode.swift
//  algorithm
//
//  Created by penggongxu on 2021/3/26.
//  单向链表结点

import Foundation

public class ListNode {
    var value: Int
    var nextNode: ListNode?
    init(value: Int, nextNode: ListNode?) {
        self.value = value
        self.nextNode = nextNode
    }
}
