//
//  HFClient.m
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFClient.h"
#import <netdb.h>

@implementation HFClient

+ (void)getRequest:(NSString *)URLString
            parameters:(NSDictionary *)parameters
              progress:(void (^)(NSProgress *downloadProgress))downloadProgress
               success:(void (^)(NSURLSessionDataTask *task, id response))success
               failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
             noNetWork:(void (^)(void))noNetwork
{
    if (![self connectedToNetwork]) {
        if (noNetwork) {
            noNetwork();
        }
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    manager.requestSerializer.timeoutInterval = 20.0;
    [manager GET:[kURLRequest stringByAppendingString:URLString] parameters:parameters progress:downloadProgress success:success failure:failure];
}

+ (BOOL)connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

@end
