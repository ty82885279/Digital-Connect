//
//  LLTools.m
//  106Lottery
//
//  Created by MrLee on 2017/7/4.
//  Copyright © 2017年 刘元富. All rights reserved.
//

#import "LLTools.h"

@implementation LLTools

//获取当前时间
+(NSString *)getNowTimeTimestamp
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *strDate = [formatter stringFromDate:datenow ];
    
    //LTLog(@"时间-----%@",strDate);
    
    //NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return strDate;
    
}
//获取当前时间戳
+(NSString *)getNowTimeTimes
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    //NSString *strDate = [formatter stringFromDate:datenow ];
    
    //LTLog(@"时间-----%@",strDate);
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
    
}

//根据日期获取周几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
//时间戳转日期
+ (NSString *)formatYearMonthDay:(NSTimeInterval)time
{
    if (time < 0) return @"";
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    //注意：这里设置格式：2016：8：10
    //[format setDateFormat:@"yyyy年MM月dd日"];
    [format setDateFormat:@"yyyy-MM-dd"];
    //如果是这种：那么返回的时间是：2016-08-10
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSString *str = [format stringFromDate:date];
    return str;
}



@end
