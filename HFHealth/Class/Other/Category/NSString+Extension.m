//
//  NSString+Extension.m
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "NSString+Extension.h"

#import "CommonUtil.h"

@implementation NSString (Extension)


#pragma mark - 生成签名
- (NSString *)getSingWithParams:(NSMutableDictionary *)params
{
    NSArray* keys = [params allKeys];
    
    NSArray *values = [params allValues];
    
    
    NSString *signString;
    
    NSMutableArray *stringArray1 = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0 ; i<keys.count; i++)
    {
        NSString *subString = [NSString stringWithFormat:@"%@=%@",[keys objectAtIndex:i],[values objectAtIndex:i]];
        [stringArray1 addObject:subString];
    }
    //对数组stringArray1进行排序
    [self my_sort:stringArray1 loc:0];
    
    signString = [stringArray1 componentsJoinedByString:@""];//第2步
    signString = [signString stringByReplacingOccurrencesOfString:@"=" withString:@""];//去掉等号
    signString = [NSString stringWithFormat:@"%@%@",signString,secret_key];//第3步 拼接secret_key
    signString = [signString lowercaseString];//大写转小写
    //            NSLog(@"signString = %@",signString);
    signString = [signString stringByReplacingOccurrencesOfString:@" " withString:@""];//去掉空格
    
    signString = [signString urlEncoded];//进行urlEncoded
    signString = [signString lowercaseString];////这里再进行一步小写转码是因为如果传入的数据有汉字，则转码后还是大写的，所以要转成小写
    
    //MD5加密
    signString = [CommonUtil md5:signString];
    
    return signString;
}

- (void)my_sort:(NSMutableArray *) my_array loc:(NSUInteger)loc
{
    BOOL changed = YES;
    do {
        changed = NO;
        for (int i=1; i<my_array.count; ++i) {
            
            NSString *n = [my_array objectAtIndex:i-1] ;
            NSString *m = [my_array objectAtIndex:i];
            ;
            
            if (![self compareA:n andB:m index:0]) {
                NSString * temp = [my_array objectAtIndex:i-1];
                [my_array replaceObjectAtIndex:i-1 withObject:[my_array objectAtIndex:i]];
                [my_array replaceObjectAtIndex:i withObject:temp];
                changed = YES;
            } else {
                
            }
        }
    } while (changed);
}

- (BOOL)compareA:(NSString*)a andB:(NSString*)b index:(NSUInteger)loc
{
    if (a.length < loc+1) { //a字符串是b的一部分
        return YES;
    }
    if (b.length < loc+1) {//b字符串是a的一部分
        return NO;
    }
    //不考虑相等的字符串
    NSString *n = [a substringWithRange:NSMakeRange(loc, 1)];
    NSString *m = [b substringWithRange:NSMakeRange(loc, 1)];
    NSComparisonResult result = [n compare:m];//不忽略大小写的比较  //[n compare:m options:NSCaseInsensitiveSearch];//忽略大小写的比较
    if (result == NSOrderedAscending) {//升序 a>b
        return YES;
    } else if (result == NSOrderedDescending) {//降序 a<b
        return NO;
    } else { //相等 就去下一个字符比较
        loc++;
        return [self compareA:a andB:b index:loc];
    }
}

/**
 *  生成时间戳
 *
 *  @return 时间戳
 */
+ (NSString *)getTimeStamp
{
    NSDate *datenow = [[NSDate date] dateByAddingTimeInterval:8 * 60 * 60];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSSS";
    NSString *dateString = [dateFormatter stringFromDate:datenow];
    NSTimeInterval a = [[dateFormatter dateFromString:dateString] timeIntervalSince1970] * 1000;
    NSString *timeSp = [NSString stringWithFormat:@"%f", a];
    NSArray *timeArr = [timeSp componentsSeparatedByString:@"."];
    
    return [timeArr objectAtIndex:0];
}

+ (NSString *)stringFromDateTime:(NSDate*)dateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:dateTime];
}

-(NSString *)getStringByRegex:(NSString *)regex
{
    NSRegularExpression *regexExp = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    NSRange range = [regexExp rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if (range.length == 0) {
        return @"";
    }
    else {
        return [self substringWithRange:range];
    }
}

-(NSDate *)toDateByFormatter:(NSString *)formatter
{
    if (self.length == 0) {
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:self];
}

- (NSDate *)toDate;
{
    return [self toDateByFormatter:@"yyyy-MM-dd"];
}

- (NSDate *)toDateTime;
{
    return [self toDateByFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSDate *)toFullDateTime;
{
    return [self toDateByFormatter:@"yyyy-MM-dd HH:mm:ss zzz"];
}

- (NSDate *)toTime;
{
    return [self toDateByFormatter:@"HH:mm:ss"];
}

- (NSString *)urlEncoded
{
    NSString *encoded = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(
                                                                                             NULL,
                                                                                             (__bridge CFStringRef)self,
                                                                                             NULL,
                                                                                             (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                             kCFStringEncodingUTF8 );
    return encoded;
}

- (BOOL) isValidFileName {
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"\\/:*?\"<>|"];
    NSRange range = [self rangeOfCharacterFromSet:characterSet];
    return range.location == NSNotFound;
}

- (BOOL)isValidEmailAddress
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

#if TARGET_OS_IPHONE
- (NSString *)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font
{
    NSString *result = [NSString stringWithString:self];
    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    while ([result sizeWithAttributes:attributesDic].width > width)
    {
        result = [result stringByReplacingOccurrencesOfString:@"..." withString:[NSString string]];
        
        result = [[result substringToIndex:([result length] - 1)] stringByAppendingString:@"..."];
    }
    
    return result;
}
#endif

- (NSString *)reverse
{
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[self substringWithRange:subStrRange]];
    }
    
    return reversedString;
}

+ (NSString *)stringFromJsonArray:(NSArray *)jsonArray
{
    NSString *jsonString = nil;
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonArray
                                                           options:kNilOptions
                                                             error:nil];
        jsonString = [[NSString alloc] initWithData:jsonData
                                           encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}

+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString *outputStr = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    return outputStr;
}
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    if (input == nil) {
        return nil;
    }
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}


@end
