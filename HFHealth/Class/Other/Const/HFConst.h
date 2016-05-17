//
//  HFConst.h
//  HFHealth
//
//  Created by zhf on 16/5/17.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HFRefreshType)
{
    HFRefreshTypeNormal, // 正常
    HFRefreshTypeLoadMore, // 加载更多
    HFRefreshTypePullDown // 下拉刷新
};


@interface HFConst : NSObject

@end
