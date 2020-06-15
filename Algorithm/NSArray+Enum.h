//
//  NSArray+Enum.h
//  Algorithm
//
//  Created by penggongxu on 2020/6/10.
//  Copyright © 2020 personnal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Enum)

- (void)enumerateObjectsWithBlock:(void (^)(id _Nonnull obj, NSUInteger index, BOOL * _Nonnull stop))block;

@end

NS_ASSUME_NONNULL_END
