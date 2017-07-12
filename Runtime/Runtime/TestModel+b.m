//
//  TestModel+b.m
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "TestModel+b.h"

@implementation TestModel (b)

- (void)test {
    _SUPER_SELF_METHOD_;
    NSLog(@"%@============%@===========分类b=====无参数", self, [self class]);
}

- (void)test:(BOOL)isflag {
    _SUPER_SELF_METHOD_BOOL(isflag);
    NSLog(@"%@============%@===========分类b", self, [self class]);
}
@end
