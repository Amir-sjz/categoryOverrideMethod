//
//  TestModel+a.m
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "TestModel+a.h"

@implementation TestModel (a)
- (void)test {
    _SUPER_SELF_METHOD_
    NSLog(@"%@============%@===========分类a=====无参数", self, [self class]);
}

- (void)test:(BOOL)isflag {
    _SUPER_SELF_METHOD_BOOL(isflag);
    NSLog(@"%@============%@===========分类a", self, [self class]);
}
@end
