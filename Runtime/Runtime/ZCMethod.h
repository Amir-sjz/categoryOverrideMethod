//
//  ZCMethod.h
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _SUPER_SELF_METHOD_ [ZCMethod _MainClassMethod:_cmd WithClass:[self class] WithOBJ:self];

//#define _SUPER_SELF_METHOD_(type) [ZCMethod _MainClassMethod:_cmd WithClass:[self class] WithOBJ:self Type:type];

#define _SUPER_SELF_METHOD_BOOL(type) [ZCMethod _MainClassMethod:_cmd WithClass:[self class] WithOBJ:self BOOLType:type];

@interface ZCMethod : NSObject

+ (void)_MainClassMethod:(SEL)selector WithClass:(Class)myClass WithOBJ:(id)objc;

+ (void)_MainClassMethod:(SEL)selector WithClass:(Class)myClass WithOBJ:(id)objc BOOLType:(BOOL)par;
@end
