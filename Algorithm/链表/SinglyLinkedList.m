//
//  SinglyLinkedList.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/5.
//  Copyright © 2020 personnal. All rights reserved.
//
//  单向链表操作

#import "SinglyLinkedList.h"


@implementation SinglyLinkedList

- (ListNode *)nodeWithValue:(int)value {
    ListNode *currentNode = _headNode;
    while (currentNode && currentNode.value != value) {
        currentNode = currentNode.nextNode;
    }
    return nil;
}

- (ListNode *)nodeAtIndex:(NSUInteger)index {
    NSUInteger position = 0;
    ListNode *currentNode = _headNode;
    while (currentNode && position != index) {
        currentNode = currentNode.nextNode;
        position++;
    }
    return currentNode;;
}

- (void)insertNodeWithValue:(int)value {
    [self insertNode:[ListNode nodeWithValue:value]];
}

- (void)insertNode:(nonnull ListNode *)node {
    node.nextNode = _headNode;
    _headNode = node;
}

- (void)insertNode:(nonnull ListNode *)nodeInserted afterNode:(nonnull ListNode *)node {
    if (!_headNode) {
        _headNode = nodeInserted;
        return;
    }
    nodeInserted.nextNode = node.nextNode;
    node.nextNode = nodeInserted;
}

- (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode *)node {
    [self insertNode:[ListNode nodeWithValue:value] afterNode:node];
}

- (void)insertNode:(nonnull ListNode *)nodeInserted beforeNode:(nonnull ListNode *)node {
    // 哨兵（边界问题）
    ListNode *fakeNode = [ListNode nodeWithValue:0];
    fakeNode.nextNode = _headNode;
    ListNode *currentNode = fakeNode;
    while (currentNode.nextNode && currentNode.nextNode != node) {
        currentNode = currentNode.nextNode;
    }
    if (!currentNode.nextNode) {// 空链表
        return;
    }
    nodeInserted.nextNode = node;
    currentNode.nextNode = nodeInserted;
}

- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode *)node {
    [self insertNode:[ListNode nodeWithValue:value] beforeNode:node];
}

- (void)deleteNode:(ListNode *)node {
    if (!_headNode) {
        return;
    }
    if (node.nextNode) {// 非尾结点
        node.value = node.nextNode.value;
        node.nextNode = node.nextNode.nextNode;
//        node = node.nextNode;
        return;
    }
    // 存在头结点，并且需要删除的结点是尾结点
    ListNode *currentNode = _headNode;
    while (currentNode.nextNode && currentNode.nextNode != node) {// 遍历，找到需要删除node的前一个结点
        currentNode = currentNode.nextNode;
    }
    currentNode.nextNode = nil;
}

- (void)deleteNodeWithValue:(int)value {
    ListNode *fakeNode = [ListNode nodeWithValue:value + 1];
    fakeNode.nextNode = _headNode;
    ListNode *preNode = fakeNode;
    ListNode *currentNode = _headNode;// 需要删除的node
    while (preNode.nextNode && preNode.nextNode.value != value) {
        preNode = currentNode;
        currentNode = currentNode.nextNode;
    }
    currentNode = currentNode.nextNode;
}

/// 链表反转
- (ListNode *)reverseHeadNode {
    ListNode *reverseHeadNode = nil;// 反转之后的头结点
    ListNode *currentNode = nil;// 反转之前的前一个结点
    ListNode *preNode = nil;// 反转前当前的结点
    currentNode = _headNode;// 从头结点开始反转
    while (currentNode) {// 遍历操作
        // 记录下当前结点的下一个结点
        ListNode *nextNode = currentNode.nextNode;
        if (!nextNode) {// 当前结点为尾结点
            reverseHeadNode = currentNode;
        }
        currentNode.nextNode = preNode;// 设置当前结点的下个结点为前一个结点（反转）
        preNode = currentNode;
        currentNode = nextNode;
    }
    return reverseHeadNode;// 返回反转后的头结点
}

/// 闭环检测
- (BOOL)checkCircle:(ListNode *)headNode {
    if (!headNode) {
        return NO;
    }
    ListNode *fastNode = headNode.nextNode;
    ListNode *slowNode = headNode;
    while (fastNode && fastNode.nextNode) {
        fastNode = fastNode.nextNode.nextNode;
        slowNode = slowNode.nextNode;
        if (fastNode == slowNode) {
            return YES;
        }
    }
    return NO;
}

/// 两个有序链表的合并
+ (ListNode *)mergeList:(ListNode *)listHead withList:(ListNode *)listHead1 {
    ListNode *fakeNode = [ListNode nodeWithValue:0];
    ListNode *p = fakeNode;
    while (listHead || listHead1) {
        if (listHead.value > listHead1.value) {
            p.nextNode = listHead;
            listHead = listHead.nextNode;
        } else {
            p.nextNode = listHead1;
            listHead1 = listHead1.nextNode;
        }
        p = p.nextNode;
    }
    return fakeNode.nextNode;
}

/// 寻找中间结点
- (ListNode *)getMiddleNode {
    if (!_headNode) {
        return nil;
    }
    ListNode *fast = _headNode;
    ListNode *slow = _headNode;
    while (fast && fast.nextNode) {
        fast = fast.nextNode.nextNode;
        slow = slow.nextNode;
    }
    return slow;
}

/// 删除倒数第N个结点
/// @param lastNum 倒数第N个结点
- (void)deleteNodeAtLastIndex:(NSInteger)lastNum {
    NSInteger index = 1;
    ListNode *fast = _headNode;
    while (fast && index < lastNum) {
        fast = fast.nextNode;
        index++;
    }
    if (!fast) {
        return;
    }
    ListNode *slow = _headNode;
    ListNode *preNode = nil;
    while (fast.nextNode) {
        preNode = slow;
        slow = slow.nextNode;
        fast = fast.nextNode;
    }
    if (preNode) {
        preNode.nextNode = slow.nextNode;
    } else {
        _headNode = _headNode.nextNode;
    }
}

@end
