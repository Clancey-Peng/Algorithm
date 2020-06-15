//
//  SinglyLinkedList.h
//  Algorithm
//
//  Created by penggongxu on 2020/6/5.
//  Copyright © 2020 personnal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@interface SinglyLinkedList : NSObject

/** 头结点 */
@property (nonatomic, strong) ListNode *headNode;

/// 获取值对应的结点
- (ListNode *)nodeWithValue:(int)value;

- (ListNode *)nodeAtIndex:(NSUInteger)index;

- (void)insertNodeWithValue:(int)value;
- (void)insertNode:(nonnull ListNode *)node;
- (void)insertNode:(nonnull ListNode *)nodeInserted afterNode:(nonnull ListNode *)node;
- (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode *)node;
- (void)insertNode:(nonnull ListNode *)nodeInserted beforeNode:(nonnull ListNode *)node;
- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode *)node;

- (void)deleteNode:(nonnull ListNode *)node;
- (void)deleteNodeWithValue:(int)value;

+ (ListNode *)mergeList:(ListNode *)listHead withList:(ListNode *)listHead1;

- (ListNode *)getMiddleNode;

- (void)deleteNodeAtLastIndex:(NSInteger)lastNum;

@end

