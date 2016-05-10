//
//  UIView+Swizzle.m
//  HFHealth
//
//  Created by zhf on 16/5/10.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "UIView+Swizzle.h"
#import <objc/runtime.h>

@implementation UIView (Swizzle)


//+ (void)load
//{
//    Method originalMethod = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
//    
//    Method exchangeMethod = class_getInstanceMethod([self class], @selector(zhf_setBackgroundColor:));
//    
//    method_exchangeImplementations(originalMethod, exchangeMethod);
//    
//}
//
//- (void)zhf_setBackgroundColor:(UIColor *)color
//{
//    NSLog(@"%s", __FUNCTION__);
//    
//    /**
//     1.更改颜色
//     2.所有继承自UIView的控件,设置背景色都会设置成自定义的'orangeColor'
//     3. 此时调用的方法 'pb_setBackgroundColor' 相当于调用系统的 'setBackgroundColor' 方法,原因是在load方法中进行了方法交换.
//     4. 注意:此处并没有递归操作.
//     */
//    [self zhf_setBackgroundColor:[UIColor orangeColor]];
//}




@end
