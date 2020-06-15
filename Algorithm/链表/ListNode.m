//
//  ListNode.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/9.
//  Copyright © 2020 personnal. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode


- (instancetype)initNodeWithValue:(int)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}

+ (instancetype)nodeWithValue:(int)value {
    return [[self alloc] initNodeWithValue:value];
}

@end
