//
//  ViewController.m
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "ViewController.h"
#import "TestModel+category.h"
//#import "TestModel+b.h"
//#import "TestModel+a.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    
    TestModel *model = [[TestModel alloc] init];
    [model test:YES];
    [model test];
    
}


@end
