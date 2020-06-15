//
//  NSArray+Description.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/11.
//  Copyright © 2020 personnal. All rights reserved.
//

#import "NSArray+Description.h"

@implementation NSArray (Description)

- (NSString *)debugDescription
{
    NSMutableString *info = [NSMutableString stringWithFormat:@"<%@: %p>", [self class], self];
    for (NSInteger index = 0; index < self.count; index++) {
        [info appendString:[NSString stringWithFormat:@"\n<第%ld个数据地址: %p>", index, self[index]]];
    }
    return info;
}

- (NSString *)description {
    NSMutableString *info = [NSMutableString stringWithFormat:@"<%@: %p>", [self class], self];
    for (NSInteger index = 0; index < self.count; index++) {
        [info appendString:[NSString stringWithFormat:@"\n<第%ld个数据地址: %p>", index, self[index]]];
    }
    return info;
}

@end
