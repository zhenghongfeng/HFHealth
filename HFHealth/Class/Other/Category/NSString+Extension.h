//
//  NSString+Extension.h
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSString *)getSingWithParams:(NSMutableDictionary *)params;

+ (NSString *)getTimeStamp;

+ (NSString *)stringFromDateTime:(NSDate*)dateTime;

- (NSString *)getStringByRegex:(NSString *)regex;

- (NSDate *)toDateByFormatter:(NSString *)formatter;
- (NSDate *)toDate;
- (NSDate *)toDateTime;
- (NSDate *)toFullDateTime;
- (NSDate *)toTime;

- (NSString *)urlEncoded;

- (NSString *)reverse;

#if TARGET_OS_IPHONE
- (NSString *)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font;
#endif

- (BOOL)isValidFileName;
- (BOOL)isValidEmailAddress;

+ (NSString *)stringFromJsonArray:(NSArray *)jsonArray;

+ (NSString *)encodeToPercentEscapeString:(NSString *)input;

+ (NSString *)decodeFromPercentEscapeString:(NSString *)input;

@end
