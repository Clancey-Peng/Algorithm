//
//  NSArray+Enum.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/10.
//  Copyright © 2020 personnal. All rights reserved.
//

#import "NSArray+Enum.h"

@implementation NSArray (Enum)

- (void)enumerateObjectsWithBlock:(void (^)(id _Nonnull, NSUInteger, BOOL * _Nonnull))block {
    BOOL stop = NO;
    for (NSInteger index = 0; index < self.count; index++) {
        if (stop) {
            break;
        } else {
            block(self[index], index, &stop);
        }
    }
}

@end
