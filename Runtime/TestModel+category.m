//
//  TestModel+category.m
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "TestModel+category.h"

@implementation TestModel (category)

- (void)test {
    _SUPER_SELF_METHOD_
    NSLog(@"%@============%@===========分类category=====无参数", self, [self class]);
}

- (void)test:(BOOL)isflag {
    _SUPER_SELF_METHOD_BOOL(isflag);
    NSLog(@"%@============%@===========分类category", self, [self class]);
}

@end
