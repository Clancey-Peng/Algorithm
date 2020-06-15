//
//  ArrayStack.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/12.
//  Copyright © 2020 personnal. All rights reserved.
//

#import "ArrayStack.h"

@interface ArrayStack ()

/** 容量 */
@property (nonatomic, assign) NSUInteger capacity;
/** 栈数组 */
@property (nonatomic, strong) NSMutableArray *array;
    
@end

@implementation ArrayStack

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        self.array = [NSMutableArray arrayWithCapacity:capacity];
        self.capacity = capacity;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.array.count == 0;
}

- (BOOL)isFull {
    return self.array.count == self.capacity;
}

- (id)top {
    if ([self isEmpty]) {
        return nil;
    }
    return self.array[self.array.count - 1];
}

- (id)pop {
    if ([self isEmpty]) {
        return nil;
    }
    NSUInteger index = self.array.count - 1;
    id obj = self.array[index];
    [self.array removeObject:obj];
    return obj;
}

- (BOOL)push:(id)obj {
    if (!obj) {
        return NO;
    }
    if ([self isFull]) {
        return NO;
    }
    [self.array addObject:obj];
    return YES;
}


@end
