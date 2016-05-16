//
//  TimeUtil.h
//  Tool
//
//  Created by apple on 14-10-29.
//  Copyright (c) 2014年 wiselink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject
//字符串为空判断
+(BOOL) isValueableString:(NSString *)content;
+(BOOL) isValueableObject:(NSObject *)obj;


//获取当前日期
+(NSString *)getCurrentDate:(BOOL)isShowSecond;
+ (NSString *)getCurrentDate1: (NSString *)formatter;


//长整形时间转换为字符串时间
+ (NSString *)getStringDateFromLongInt:(long)seconds;
//string型长整形时间  转换为固定格式的string日期类型
+ (NSString *)getStringDateFromLongInt1:(long long)seconds formatter:(NSString *)formatter;


//时间转时间戳  long
+ (long)getLongIntTime: (NSString *)strDate;
//时间转时间戳   string
+ (NSString *)getLongIntTimeWithString:(NSString *)strDate;


//string型转换为date型时间
+ (NSDate *)dateFormatToDate:(NSString *)strDate;

//根据任意格式的string时间  转换date格式
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;


//  今天之前的日期显示红色     今天的显示绿色    过了今天的显示黄色     currTime是服务器下发的当前时间
//+ (UIColor *)getColorCompareCurrentDate:(NSString *)compareTime andCurrTime:(NSString *)currTime;
//// --------------    长整形
//+ (UIColor *)getColorCompareCurrentDate1:(long)compareTime andCurrTime:(long)currTime;



//目标时间距当前时间间隔
+ (NSString *)changeTimeIntervalDistanceToWords:(NSTimeInterval)timeInterval;

//任意两个string时间的时间间隔
+ (NSTimeInterval )getTimeIntervalFromdate1: (NSString *)date1 andDate2: (NSString *)date2;

//任意两个长整形时间的时间间隔
+ (NSTimeInterval)getTimeIntervalFromdate11:(long)date1 andDate22:(long)date;

//两个date时间间隔
+ (NSTimeInterval)compareTwoTimeInterval:(NSDate*) compareDate date:(NSDate *)date;

//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSDate *)dateAfterDay:(int)day;

//计算星期几
+ (NSString *)getWeekDayByDate:(NSDate *)date;

//两个日期相差多少天
+ (int)getDaysFromDate:(NSDate *)date currDate:(NSDate *)now;

@end
