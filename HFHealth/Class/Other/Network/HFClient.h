//
//  HFClient.h
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

// 线上线下切换的时候只用改这里就可以了，1是测试环境，0是正式环境
#define kURLEnvironment 0

//因为项目里的apiversion都统一了  所以之后再有请求接口的版本号变化变化 直接改这里就可以了
#define kURLDevelop         @"http://kkhealth.api.kk-me.com/v6"  //测试环境
#define kURLDistribution    @"http://healthchina.api.kk.net/v6"     //正式环境

//  h5页面使用的大地址
#define  kBaseDevelopmentHtml   @"http://kkhealth.h5.kk-me.com" //测试环境
#define  kBaseProductionHtml    @"http://kkhealth.h5.kk.net"    //正式环境

// 三目运算符
#define kURLRequest      kURLEnvironment ? kURLDevelop : kURLDistribution

#define  kBaseURLRequestHtml  kURLEnvironment ? kBaseDevelopmentHtml : kBaseProductionHtml

@interface HFClient : NSObject

+ (void)getRequest:(NSString *)URLString
        parameters:(NSDictionary *)parameters
          progress:(void (^)(NSProgress *downloadProgress))downloadProgress
           success:(void (^)(NSURLSessionDataTask *task, id response))success
           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
         noNetWork:(void (^)(void))noNetwork;

@end
