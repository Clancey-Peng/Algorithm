//
//  ListNode.h
//  Algorithm
//
//  Created by penggongxu on 2020/6/9.
//  Copyright © 2020 personnal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ListNode : NSObject <NSCoding>

/** 值 */
@property (nonatomic, assign) int value;
/** 下一个结点 */
@property (nonatomic, strong) ListNode *nextNode;

/// 初始化方法
/// @param value 值
- (instancetype)initNodeWithValue:(int)value;

+ (instancetype)nodeWithValue:(int)value;


@end

