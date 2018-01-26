//
//  LLTools.h
//  106Lottery
//
//  Created by MrLee on 2017/7/4.
//  Copyright © 2017年 刘元富. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLTools : NSObject

+(NSString *)getNowTimeTimestamp; //获取当前时间

+(NSString *)getNowTimeTimes; //获取当前时间戳

+(NSString*)weekdayStringFromDate:(NSDate*)inputDate; //根据日期获取周几

+ (NSString *)formatYearMonthDay:(NSTimeInterval)time ;//时间戳转日期

@end
