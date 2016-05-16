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
        [HFArticle mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"myDescription": @"description"
                     };
        }];
    }
    return self;
}
//- (instancetype)initWithDic:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        self.imageurl = dic[@"imageurl"];
//        self.mpname = dic[@"mpname"];
//        self.title = dic[@"title"];
//    }
//    return self;
//}
//
//+ (instancetype)dossierWithDic:(NSDictionary *)dic
//{
//    return [[self alloc] initWithDic:dic];
//}
//
//// 字典数组转模型数组
//+ (NSMutableArray *)arrayWithDossierList:(NSArray *)array
//{
//    NSMutableArray *arr = [NSMutableArray array];
//    for (NSDictionary *dic in array) {
//        [arr addObject:[HFArticle dossierWithDic:dic]];
//    }
//    return arr;
//}

@end
