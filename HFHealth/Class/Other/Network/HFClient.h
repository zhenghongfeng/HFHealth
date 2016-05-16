//
//  HFClient.h
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFClient : NSObject

+ (void)getRequest:(NSString *)URLString
        parameters:(NSDictionary *)parameters
          progress:(void (^)(NSProgress *downloadProgress))downloadProgress
           success:(void (^)(NSURLSessionDataTask *task, id response))success
           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
         noNetWork:(void (^)(void))noNetwork;

@end
