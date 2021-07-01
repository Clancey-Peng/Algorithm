//
//  CPSinglyLinkList.swift
//  algorithm
//
//  Created by penggongxu on 2021/3/26.
//  单向链表

import Foundation

class ListNode<T> {
    var value: T?
    var nextNode: ListNode<T>?
    
    init() {}
    
    init(value: T) {
        self.value = value
    }
}

public class CPSinglyLinkList<Element: Equatable> {
    
    private var dummy: ListNode<Element> = ListNode<Element>() // 哨兵结点
    
    init(withHeadNode node: ListNode<Element>?) {
        dummy.nextNode = node
    }
    
    var size: Int {
        var tempNode = dummy.nextNode
        var num = 0
        while tempNode != nil {
            num += 1
            tempNode = tempNode?.nextNode
        }
        return num
    }
    
    var isEmpty: Bool {
        return self.size == 0
    }
    
    var headNode: ListNode<Element>? {
        return dummy.nextNode
    }
    
    /// 返回值对应的node
    func node(with value: Element) -> ListNode<Element>? {
        var tempNode = dummy.nextNode
        while tempNode != nil {
            if value == tempNode?.value {
                return tempNode
            }
            tempNode = tempNode?.nextNode
        }
        return nil
    }
    
    func insertToHead(node: ListNode<Element>) {
        node.nextNode = dummy.nextNode
        dummy.nextNode = node
    }
    
    func insertToHead(value: Element) {
        let node = ListNode.init(value: value)
        self.insertToHead(node: node)
    }
    
    func insert(after node: ListNode<Element>, newNode: ListNode<Element>) {
        newNode.nextNode = node.nextNode
        node.nextNode = newNode
    }
    
    func insert(after node: ListNode<Element>, newValue: Element) {
        let newNode = ListNode.init(value: newValue)
        self.insert(after: node, newNode: newNode)
    }
    
    func insert(before node: ListNode<Element>, newNode: ListNode<Element>) {
        var preNode: ListNode<Element>? = dummy
        var tempNode = dummy.nextNode
        while tempNode != nil {
            if tempNode === newNode {
                newNode.nextNode = tempNode
                preNode?.nextNode = newNode
                break
            }
            preNode = tempNode
            tempNode = tempNode?.nextNode
        }
    }
}
