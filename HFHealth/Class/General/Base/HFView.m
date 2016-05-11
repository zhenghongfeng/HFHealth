//
//  HFView.m
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFView.h"

@implementation HFView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self hf_setupViews];
        [self hf_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id <HFViewProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self hf_setupViews];
        [self hf_bindViewModel];
    }
    return self;
}

- (void)hf_bindViewModel {
}

- (void)hf_setupViews {
}

@end
