//
//  Regular.h
//  huochepiao
//
//  Created by Jie on 14-4-24.
//  Copyright (c) 2014年 huochepiao. All rights reserved.
//
/*
    正则表达
 */

#import <Foundation/Foundation.h>

@interface Regular : NSObject

#pragma mark - 正则表达 有以下
#pragma mark - 匹配6位纯数字
+ (BOOL)password:(NSString*)passw;
#pragma mark - 匹配18位身份证号
+ (BOOL)id18NumberIsRegular:(NSString *)number;



#pragma mark - 下面是参考demo
+ (BOOL) numberString:(NSString *)numberString IsLength:(int)length;
+ (BOOL) phoneIsRegular:(NSString *) phoneStr;
+ (BOOL) isValidateTelNumber:(NSString*)number;//判断是否是电话号码
+ (BOOL) isValidateEmail:(NSString*)email;//邮箱验证
+ (BOOL) isZimu:(NSString*)string;//字符串首字母是否为字母
+ (BOOL) isZim:(NSString*)string;//字符串是否为字母
+ (NSArray*) filterArray:(NSArray*)array With:(NSString*)str;//对Array进行过滤
+ (BOOL) isZipCode:(NSString*)number;//邮编验证  密码验证
//+ (BOOL) isIds:(NSString*)number;//身份证号验证
#pragma mark -
//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
+ (BOOL) isYanZhengMa:(NSString*)number;//验证码
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard:(NSString *)identityCard;
//姓名
+ (BOOL) validateName:(NSString *)name;
// 中文验证
+ (BOOL) isChinaText:(NSString *)chinaStr;
@end

