//
//  HFViewProtocol.h
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HFViewModelProtocol;

@protocol HFViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <HFViewModelProtocol>)viewModel;

- (void)hf_bindViewModel;
- (void)hf_setupViews;
- (void)hf_addReturnKeyBoard;

@end
