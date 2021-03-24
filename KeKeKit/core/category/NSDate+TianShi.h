//
//  NSDate+TianShi.h
//  VoiceHelper
//
//  Created by CZK on 2019/12/7.
//  Copyright © 2019 czk. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (TianShi)
+(BOOL)nowIsAM;
/**
 *  得到这个周的第一天和最后一天
 */
+(NSArray *)getFirstAndLastDayOfWeekDate:(NSDate*)date;
/**
 得到这个月有几天

 @param yearmonth yyyy-MM
 @return 天数
 */
+(NSUInteger)getDaysOfYearMonth:(NSString*)yearmonth;
/**
 *  得到这个月的第一天和最后一天
 */
+(NSArray *)getFirstAndLastDayOfThisMonth;
/**
 *  得到今年的第一天和最后一天
 */
+(NSArray *)getFirstAndLastDayOfThisYear;
/**
 *  得到本周的号们
 */
+ (NSArray*)getDateWeek_daysDuraingDate:(NSDate*)date;

/**
 获取这月有多少天

 @return  获取这月有多少天
 */
+(NSUInteger)getDaysOfThisMonth;
@end

NS_ASSUME_NONNULL_END
