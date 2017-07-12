//
//  ZCMethod.m
//  Runtime
//
//  Created by chengZ on 2017/7/11.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "ZCMethod.h"

#import <objc/runtime.h>

@implementation ZCMethod

+ (void)_MainClassMethod:(SEL)selector WithClass:(Class)myClass WithOBJ:(id)objc {
    
    NSString *key = NSStringFromSelector(selector);
    
    if (!objc_getAssociatedObject(objc, (__bridge const void *)(key))) {
        objc_setAssociatedObject(objc, (__bridge const void *)(key), @(NO), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    id isVisitNumber = objc_getAssociatedObject(objc, (__bridge const void *)(key));
    BOOL isVisit = ((NSNumber *)isVisitNumber).boolValue;
    
    if (isVisit) {
        return;
    }
    
    Class currentClass = myClass;
    
    if (currentClass) {
        unsigned int methodCount;
        Method *methodList = class_copyMethodList(currentClass, &methodCount);
        IMP lastImp = NULL;
        SEL lastSel = NULL;
        
        NSMutableArray *selArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < methodCount; i++) {
            Method method = methodList[i];
            NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method))
                                                      encoding:NSUTF8StringEncoding];
            if ([NSStringFromSelector(selector) isEqualToString:methodName]) {
                lastImp = method_getImplementation(method);
                lastSel = method_getName(method);
                if (lastImp != NULL) {
                    [selArray addObject:(__bridge id _Nonnull)(method)];
                }
            }
        }
        
        if (selArray.count<=1) {
            free(methodList);
            return;
        } else {
            isVisit = YES;
            objc_setAssociatedObject(objc, (__bridge const void *)(key), @(isVisit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            for (NSInteger i=selArray.count-1; i > 0; i--) {
                Method tempMethod = (__bridge Method)selArray[i];
                typedef void (*fn)(id,SEL);
                lastImp = method_getImplementation(tempMethod);
                lastSel = method_getName(tempMethod);
                
                fn f = (fn)lastImp;
                f(objc,lastSel);
            }
            
            isVisit = NO;
            objc_setAssociatedObject(objc, (__bridge const void *)(key), @(isVisit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            free(methodList);
        }
        
    }
}


+ (void)_MainClassMethod:(SEL)selector WithClass:(Class)myClass WithOBJ:(id)objc BOOLType:(BOOL)par {
    NSString *key = NSStringFromSelector(selector);
    
    if (!objc_getAssociatedObject(objc, (__bridge const void *)(key))) {
        objc_setAssociatedObject(objc, (__bridge const void *)(key), @(NO), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    id isVisitNumber = objc_getAssociatedObject(objc, (__bridge const void *)(key));
    BOOL isVisit = ((NSNumber *)isVisitNumber).boolValue;
    
    if (isVisit) {
        return;
    }
    
    Class currentClass = myClass;
    
    if (currentClass) {
        unsigned int methodCount;
        Method *methodList = class_copyMethodList(currentClass, &methodCount);
        IMP lastImp = NULL;
        SEL lastSel = NULL;
        
        NSMutableArray *selArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < methodCount; i++) {
            Method method = methodList[i];
            NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method))
                                                      encoding:NSUTF8StringEncoding];
            if ([NSStringFromSelector(selector) isEqualToString:methodName]) {
                lastImp = method_getImplementation(method);
                lastSel = method_getName(method);
                
                NSNumber *number = [NSNumber numberWithUnsignedLong:(unsigned long)method];
                
                if (lastImp != NULL) {
                    [selArray addObject:number];
                }
            }
        }
        
        if (selArray.count<=1) {
            free(methodList);
            return;
        } else {
            isVisit = YES;
            objc_setAssociatedObject(objc, (__bridge const void *)(key), @(isVisit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            for (NSInteger i=selArray.count-1; i > 0; i--) {
                NSNumber *number = (NSNumber *)selArray[i];
                Method tempMethod = (Method)number.unsignedLongValue;
                typedef void (*fn)(id,SEL, BOOL);
                lastImp = method_getImplementation(tempMethod);
                lastSel = method_getName(tempMethod);
                
                fn f = (fn)lastImp;
                f(objc,lastSel,par);
            }
            
            isVisit = NO;
            objc_setAssociatedObject(objc, (__bridge const void *)(key), @(isVisit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            free(methodList);
        }
        
    }
}
@end
