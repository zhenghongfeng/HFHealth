//
//  HFDefine.h
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <AdSupport/ASIdentifierManager.h>

#ifndef HFDefine_h
#define HFDefine_h


// 因为项目里的apiversion都统一了  所以之后再有变化直接改这里就可以了
#define apiversion @"6"

#define secret_key @"201510"

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


/*
 应用版本
 */
#define AppVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define DeviceType  [[UIDevice currentDevice] systemVersion]
#define DeviceName  [[UIDevice currentDevice] model]
#define DeviceId    [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define IDFA        [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]

//系统版本
#define kIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark -  NSUserDefaults本地保存 宏定义区
/**
 ** 基础宏定义
 **/
#define Get(a) [[NSUserDefaults standardUserDefaults] objectForKey:a]
#define Save(a,b) [[NSUserDefaults standardUserDefaults] setObject:a forKey:b]; [[NSUserDefaults standardUserDefaults] synchronize]
/**
 ** 账号相关保存
 **/
#define UseridGet         Get(@"user_id")?Get(@"user_id"):@0
#define UseridSave(a)     Save(a,@"user_id")

#define NickNameGet       Get(@"user_nickname")
#define NickNameSave(a)   Save(a,@"user_nickname")

#define TokenGet          Get(@"user_accessToken") ? Get(@"user_accessToken") : @""
#define TokenSave(a)      Save(a,@"user_accessToken")

#define AccountTypeGet     Get(@"user_accounttype")
#define AccountTypeSave(a) Save(a,@"user_accounttype")

#define StatusGet         Get(@"user_status")
#define StatusSave(a)     Save(a,@"user_status")


#define PhoneGet          Get(@"user_phone")?Get(@"user_phone"):@""
#define PhoneSave(a)      Save(a,@"user_phone")

#define ImgpathGet        Get(@"user_imgpath")
#define ImgpathSave(a)    Save(a,@"user_imgpath")


#define AgeGet             Get(@"user_age")
#define AgeSave(a)         Save(a,@"user_age")

#define SexGet             Get(@"user_sex")
#define SexSave(a)         Save(a,@"user_sex")

#define CardNumGet         Get(@"user_cardNum")
#define CardNumSave(a)     Save(a,@"user_cardNum")

#define IsLoginGet         Get(@"user_isLogin")
#define IsLoginSave(a)     Save(a,@"user_isLogin")

#define IsAccountOffLineGet         Get(@"user_isAccountOffLine")
#define IsAccountOffLineSave(a)     Save(a,@"user_isAccountOffLine")


//屏幕宽、高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#define kMainColor [UIColor colorWithRed:255 / 255.0 green:143 / 255.0 blue:108 / 255.0 alpha:1.0]
//rgb颜色(十进制)
#define kRGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
//rgb颜色(十六进制)
#define UIColorFromHexRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0] \

//1个像素的宽度
#define SINGLE_LINE_WIDTH (1.0f/[UIScreen mainScreen].scale)

//release版本禁止输出NSLog内容

#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}


#endif /* HFDefine_h */
