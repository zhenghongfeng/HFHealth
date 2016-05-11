//
//  HFViewModelProtocol.h
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HFRefreshDataStatus) {
    HFHeaderRefresh_HasMoreData = 1,
    HFHeaderRefresh_HasNoMoreData,
    HFFooterRefresh_HasMoreData,
    HFFooterRefresh_HasNoMoreData
};

@protocol HFViewModelProtocol <NSObject>

@optional

- (instancetype)intWithModel:(id)model;

@property (strong, nonatomic)CMRequest *request;

/**
 *  初始化
 */
- (void)hf_initialize;

@end
