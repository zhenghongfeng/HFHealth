//
//  HFNetwork.m
//  HFHealth
//
//  Created by zhf on 16/5/13.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFNetworkManager.h"

@implementation HFNetworkManager

+ (HFNetworkManager *)sharedNetworkManager
{
    static HFNetworkManager *networkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkManager = [[self alloc] init];
    });
    return networkManager;
}

@end
