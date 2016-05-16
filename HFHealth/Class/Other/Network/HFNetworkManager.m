//
//  HFNetwork.m
//  HFHealth
//
//  Created by zhf on 16/5/13.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFNetworkManager.h"
#import "CommonUtil.h"
#import "HFClient.h"

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

- (void)sendGetRequestWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *downloadProgress))downloadProgress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure noNetWork:(void (^)(void))noNetwork
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:@{@"devicetype":DeviceType,
                                                                                    @"devicename":DeviceName,
                                                                                    @"deviceid":DeviceId,
                                                                                    @"idfa":IDFA,
                                                                                    @"apiversion":apiversion,
                                                                                    @"appversion":AppVersion,
                                                                                    @"timestamp":[NSString getTimeStamp],
                                                                                    @"accesstoken":TokenGet,
                                                                                    }];
    [params addEntriesFromDictionary:parameters];
    
    [params setObject:[[NSString new] getSingWithParams:params] forKey:@"sign"];
    
    [HFClient getRequest:URLString parameters:params progress:downloadProgress success:success failure:failure noNetWork:noNetwork];
}







@end
