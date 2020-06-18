//
//  LinkedStack.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/12.
//  Copyright © 2020 personnal. All rights reserved.
//  链式栈、、、、、、

#import "LinkedStack.h"
#import "ListNode.h"

@interface LinkedStack ()

@property (nonatomic, strong) ListNode *top;

@end

@implementation LinkedStack

- (BOOL)isEmpty {
    return self.top == nil;
}

- (void)push:(int)value {
    ListNode *pushedNode = [ListNode nodeWithValue:value];
    pushedNode.nextNode = self.top;
    self.top = pushedNode;
}


- (int)pop {
    if ([self isEmpty]) {
        [NSException raise:NSRangeException format:@"The stack is empty."];
    }
    int value = self.top.value;
    self.top = self.top.nextNode;
    return value;
}

@end
