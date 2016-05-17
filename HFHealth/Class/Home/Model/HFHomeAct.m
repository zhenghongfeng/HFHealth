//
//  HFHomeAct.m
//  HFHealth
//
//  Created by zhf on 16/5/17.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeAct.h"

@implementation HFHomeAct

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 替换属性名
        [HFHomeAct mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"myDescription": @"description",
                     @"myId": @"id"
                     };
        }];
    }
    return self;
}

@end
