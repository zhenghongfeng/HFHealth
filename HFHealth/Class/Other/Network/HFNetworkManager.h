//
//  HFNetwork.h
//  HFHealth
//
//  Created by zhf on 16/5/13.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define apiversion @"6"

#define secret_key @"201510"

@interface HFNetworkManager : NSObject

+ (HFNetworkManager *)sharedNetworkManager;

- (void)sendGetRequestWithURLString:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     progress:(void (^)(NSProgress *downloadProgress))downloadProgress
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                    noNetWork:(void (^)(void))noNetwork;

@end
