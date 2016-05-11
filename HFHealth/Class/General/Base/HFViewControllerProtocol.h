//
//  HFViewControllerProtocol.h
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HFViewProtocol;

@protocol HFViewControllerProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <HFViewProtocol>)viewModel;

- (void)hf_bindViewModel;
- (void)hf_addSubviews;
- (void)hf_layoutNavigation;
- (void)hf_getNewData;
- (void)recoverKeyboard;

@end
