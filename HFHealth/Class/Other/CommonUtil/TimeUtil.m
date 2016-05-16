//
//  TimeUtil.m
//  Tool
//
//  Created by apple on 14-10-29.
//  Copyright (c) 2014年 wiselink. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil
+(BOOL) isValueableString:(NSString *)content
{
    if (content != nil && (NSNull *)content != [NSNull null] && ![@"" isEqualToString:content])
    {
        return YES;
    }
    return NO;
}
/*判断是否是有效对象*/
+(BOOL) isValueableObject:(NSObject *)obj
{
    if (obj != nil && (NSNull *)obj != [NSNull null])
    {
        if ([obj isKindOfClass:[NSArray class]])
        {
            NSArray *arr =(NSArray *)obj;
            
            if (arr.count != 0)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
        return YES;
    }
    
    return NO;
}

+ (NSDateFormatter *)getDateFormatter
{
    static NSDateFormatter* format;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        format = [[NSDateFormatter alloc] init];
        [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"HKT"]];
//        [format setDateStyle:NSDateFormatterShortStyle];
//        [format setTimeStyle:NSDateFormatterNoStyle];

    });
    
    return format;
}

//获取当前日期
+(NSString *)getCurrentDate:(BOOL)isShowSecond
{
    
    NSDate *date = [NSDate date];
    //    NSTimeZone *zone = timeZone_Project;
    //    NSInteger interval = [zone secondsFromGMTForDate: date];
    //    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    NSDateFormatter *dateformat = [self getDateFormatter];
    
    //yyyy-MM-dd HH:mm:ss
    if (isShowSecond)
    {
        [dateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    else
    {
        [dateformat setDateFormat:@"yyyy-MM-dd"];
    }
    NSString * content = [dateformat stringFromDate:date];
    //    [dateformat release];
    return content;
}
+ (NSString *)getCurrentDate1: (NSString *)formatter
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformat = [self getDateFormatter];
    [dateformat setDateFormat:formatter];
    NSString *content = [dateformat stringFromDate:date];
    return content;
}

//长整形时间转换为字符串时间
+ (NSString *)getStringDateFromLongInt:(long)seconds
{
    NSDate *regDate;
    //将long型的时间戳转换成date格式
    NSString *s = [NSString stringWithFormat:@"%ld",seconds];
    if (s.length <= 10)
    {
        regDate = [NSDate dateWithTimeIntervalSince1970:[s longLongValue]];
    }
    else
    {
        regDate = [NSDate dateWithTimeIntervalSince1970:[s longLongValue]/1000];
    }
    //将date格式转换成string格式
    NSDateFormatter * dm = [self getDateFormatter];
    [dm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return  [dm stringFromDate:regDate];
}

//string型长整形时间  转换为固定格式的string日期类型
+ (NSString *)getStringDateFromLongInt1:(long long)seconds formatter:(NSString *)formatter
{
    NSDate *regDate;
    //将long型的时间戳转换成date格式
    NSString *s = [NSString stringWithFormat:@"%lld",seconds];
    if (s.length <= 10)
    {
        regDate = [NSDate dateWithTimeIntervalSince1970:[s longLongValue]];
    }
    else
    {
        regDate = [NSDate dateWithTimeIntervalSince1970:[s longLongValue]/1000];
    }
    //将date格式转换成string格式
    NSDateFormatter * dm = [self getDateFormatter];
    [dm setDateFormat:formatter];
    return  [dm stringFromDate:regDate];
}

//时间转时间戳
+ (long)getLongIntTime: (NSString *)strDate
{
//    NSLog(@"%@",[self dateFormatToDate:strDate ]);
    return (long)[[self dateFormatToDate:strDate ] timeIntervalSince1970];
}

+ (NSString *)getLongIntTimeWithString:(NSString *)strDate
{
    long a =(long)[[self dateFormatToDate:strDate ] timeIntervalSince1970];
//    NSTimeInterval aa=[[self dateFormatToDate:strDate ] timeIntervalSince1970]*1000;
    NSLog(@"%ld",a);
    NSString *s = [NSString stringWithFormat:@"%ld",a];
    return s;
}


//字符串日期转为date日期
+ (NSDate *)dateFormatToDate:(NSString *)strDate
{
    if([self isValueableString:strDate])
    {
        NSDateFormatter *dateFormat = [self getDateFormatter];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date = [dateFormat dateFromString:strDate];

//        [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm:ss "];
        
        //时差 差8小时  补时差
        NSTimeZone *zone =[NSTimeZone timeZoneWithAbbreviation:@"HKT"];
        
        NSInteger interval = [zone secondsFromGMTForDate: date];
        
        NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
        
//        return [dateFormat dateFromString:strDate];
        return localeDate;
    }
    else
    {
        return nil;
    }
}

//根据任意格式的string时间  转换date格式
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat
{
    
    NSDateFormatter *formatter = [self getDateFormatter];
    
    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    //NSTimeZone *localTime = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : strFormat];
    
    NSDate *dateTime = [formatter dateFromString:strDate];
    
    return dateTime;
}


+(NSDate *)getDateWithDateString:(NSString *)strDate
{
    
    NSDateFormatter *formatter = [self getDateFormatter];
    
//    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    //NSTimeZone *localTime = [NSTimeZone localTimeZone];
    
//    [formatter setTimeZone:timeZone];
    [formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateTime = [formatter dateFromString:strDate];
    
    return dateTime;
}

//  今天之前的日期显示红色     今天的显示绿色    过了今天的显示黄色     currTime是服务器下发的当前时间-
//+ (UIColor *)getColorCompareCurrentDate:(NSString *)compareTime andCurrTime:(NSString *)currTime
//{
//    if([self isValueableString:currTime] && [self isValueableString:compareTime])
//    {
//        
//        NSDate *date1 = [self getDateWithDateString:compareTime];
//
//        NSString *s = [[currTime componentsSeparatedByString:@" "] firstObject];
//        
//        NSString *s1 = [NSString stringWithFormat:@"%@ 00:00:00",s];
//        
//        NSDate *date2 = [self getDateWithDateString:s1];
//        
//        NSTimeInterval  timeInterval = [date1 timeIntervalSinceDate:date2];
//        
//        if (timeInterval >= 0)
//        {
//            if (timeInterval / 3600 < 24)
//            {
//                return  [UIColor greenColor];
//            }
//            else
//            {
//                return  [UIColor yellowColor];
//            }
//            
//        }
//        else
//        {
//            return  [UIColor redColor];
//        }
//        
//    }
//    return nil;
//}
////----------------长整形
//+ (UIColor *)getColorCompareCurrentDate1:(long)compareTime andCurrTime:(long)currTime;
//{
//    NSString *s = [self getStringDateFromLongInt:compareTime];
//    NSString *s1 = [self getStringDateFromLongInt:currTime];
//    
//    return [self getColorCompareCurrentDate:s andCurrTime:s1];
//}


//目标时间距当前时间间隔
+ (NSString *)changeTimeIntervalDistanceToWords:(NSTimeInterval)timeInterval
{
    long temp = 0;
    
    NSString *result;
    
    if (timeInterval > 0)
    {
        if (timeInterval < 60)
        {
            
            result = [NSString stringWithFormat:@"刚刚"];
            
        }
        else if((temp =timeInterval /60) < 60)
        {
            
            result = [NSString stringWithFormat:@"%ld分钟后",temp];
            
        }
        else if((temp = temp/60) < 24)
        {
            
            result = [NSString stringWithFormat:@"%ld小时后",temp];
            
        }
        else if((temp = temp/24) < 30)
        {
            
            result = [NSString stringWithFormat:@"%ld天后",temp];
            
        }
        else if((temp = temp/30) <12)
        {
            
            result = [NSString stringWithFormat:@"%ld月后",temp];
            
        }
        else
        {
            temp = temp/12;
            result = [NSString stringWithFormat:@"%ld年后",temp];
        }
        
    }
    else
    {
        timeInterval = -timeInterval;
        
        
        if (timeInterval < 60)
        {
            
            result = [NSString stringWithFormat:@"刚刚"];
            
        }
        else if((temp =timeInterval /60) < 60)
        {
            
            result = [NSString stringWithFormat:@"%ld分钟前",temp];
            
        }
        else if((temp = temp/60) < 24)
        {
            
            result = [NSString stringWithFormat:@"%ld小时前",temp];
            
        }
        else if((temp = temp/24) < 30)
        {
            
            result = [NSString stringWithFormat:@"%ld天前",temp];
            
        }
        else if((temp = temp/30) <12)
        {
            
            result = [NSString stringWithFormat:@"%ld月前",temp];
            
        }
        else
        {
            temp = temp/12;
            result = [NSString stringWithFormat:@"%ld年前",temp];
        }
        
    }
    
    return  result;
}

//任意两个string时间的时间间隔
+ (NSTimeInterval)getTimeIntervalFromdate1: (NSString *)date1 andDate2: (NSString *)date2
{
    NSDate *subDate1 = [self dateFormatToDate:date1];
    NSDate *subDate2 = [self dateFormatToDate:date2];
    return [subDate1 timeIntervalSinceDate:subDate2];
}

//任意两个长整形时间的时间间隔
+ (NSTimeInterval)getTimeIntervalFromdate11:(long)date1 andDate22:(long)date2
{
    NSString *s1 = [self getStringDateFromLongInt:date1];
    NSString *s2 = [self getStringDateFromLongInt:date2];
    
    return [self getTimeIntervalFromdate1:s1 andDate2:s2];
}
//两个date时间间隔
+ (NSTimeInterval)compareTwoTimeInterval:(NSDate*) compareDate date:(NSDate *)date
{
    NSTimeInterval timeInterval = [compareDate timeIntervalSinceDate:date];
    
    return timeInterval;
}

//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSDate *)dateAfterDay:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];

    [componentsToAdd setDay:day];

    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    NSTimeZone *zone =[NSTimeZone timeZoneWithAbbreviation:@"HKT"];
    
    NSInteger interval = [zone secondsFromGMTForDate: dateAfterDay];
    
    NSDate *localeDate = [dateAfterDay  dateByAddingTimeInterval: interval];
//    [componentsToAdd release];
    
    return localeDate;
}


//计算星期几
+ (NSString *)getWeekDayByDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekComp = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSInteger weekDayEnum = [weekComp weekday];
    NSString *weekDays = nil;
    switch (weekDayEnum) {
        case 1:
            weekDays = @"周日";
            break;
        case 2:
            weekDays = @"周一";
            break;
        case 3:
            weekDays = @"周二";
            break;
        case 4:
            weekDays = @"周三";
            break;
        case 5:
            weekDays = @"周四";
            break;
        case 6:
            weekDays = @"周五";
            break;
        case 7:
            weekDays = @"周六";
            break;
    }
    return weekDays;
}

//两个日期相差多少天
+ (int)getDaysFromDate:(NSDate *)date currDate:(NSDate *)now
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date  toDate:now  options:0];
    int days = (int)[comps day];
    if (days >= 0)
    {
        return days;
    }
    else
    {
        return -days;
    }
    
}
@end
