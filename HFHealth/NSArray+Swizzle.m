//
//  NSArray+Swizzle.m
//  HFHealth
//
//  Created by zhf on 16/5/10.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "NSArray+Swizzle.h"
#import <objc/runtime.h>

@implementation NSArray (Swizzle)


+ (void)load
{
    Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
    
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    method_exchangeImplementations(ori_Method, my_Method);
}

- (instancetype)myLastObject
{
    id ret = [self myLastObject];
//    NSLog(@"**********  myLastObject *********** ");
    return ret;
}



@end
