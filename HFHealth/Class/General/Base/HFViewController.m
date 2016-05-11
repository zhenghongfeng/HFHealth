//
//  HFViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFViewController.h"

@implementation HFViewController


- (instancetype)initWithViewModel:(id<HFViewControllerProtocol>)viewModel {
    
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - RAC
/**
 *  添加控件
 */
- (void)hf_addSubviews {}

/**
 *  绑定
 */
- (void)hf_bindViewModel {}

/**
 *  设置navation
 */
- (void)hf_layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)hf_getNewData {}

@end
