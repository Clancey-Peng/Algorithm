//
//  ArrayStack.h
//  Algorithm
//
//  Created by penggongxu on 2020/6/12.
//  Copyright © 2020 personnal. All rights reserved.
//  顺序栈实现
 
#import <Foundation/Foundation.h>


@interface ArrayStack : NSObject

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (BOOL)push:(id)obj;

- (id)pop;

- (id)top;

- (BOOL)isEmpty;

- (BOOL)isFull;

@end

