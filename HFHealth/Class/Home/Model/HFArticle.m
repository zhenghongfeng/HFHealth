//
//  HFArticle.m
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFArticle.h"

@implementation HFArticle

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 替换属性名
        [HFArticle mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"myDescription": @"description",
                     @"myId": @"id"
                     };
        }];
    }
    return self;
}

@end
