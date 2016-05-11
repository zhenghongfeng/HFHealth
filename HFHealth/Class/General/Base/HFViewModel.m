//
//  HFViewModel.m
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFViewModel.h"

@implementation HFViewModel

@synthesize request  = _request;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    HFViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel hf_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (CMRequest *)request {
    
    if (!_request) {
        
        _request = [CMRequest request];
    }
    return _request;
}

- (void)hf_initialize {
}

@end
