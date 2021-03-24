//
//  NSDate+TianShi.m
//  VoiceHelper
//
//  Created by CZK on 2019/12/7.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSDate+TianShi.h"

@implementation NSDate (TianShi)
+(BOOL)nowIsAM
{
    NSString*nowtime=getCurrentHHmmss();
    NSString*hourstr=[nowtime substringWithRange:NSMakeRange(0, 2)];
    int hour=[hourstr intValue];
    if (hour>=8&&hour<12) {
        return YES;
    }
    return NO;
}
+(NSArray *)getFirstAndLastDayOfWeekDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger weekday = [dateComponents weekday];   //第几天(从sunday开始)
    NSInteger firstDiff,lastDiff;
    firstDiff = [calendar firstWeekday] - weekday;
    lastDiff = [calendar firstWeekday]+6 - weekday;
    NSDate *firstDay =[date dateByAddingTimeInterval:firstDiff*24*3600];

    NSDate *lastDay =[date dateByAddingTimeInterval:lastDiff*24*3600];;
    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}
/**
 *  模式二
 *  获取当前时间所在一周的第一天和最后一天, 也即一周的日期
 *  注意：当天在这一周内，不是作为起点往后顺延
 */
+ (NSArray*)getDateWeek_daysDuraingDate:(NSDate*)date
{
        //日历格式
    NSDate *now = date;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
        // 得到：今天是星期几
        // 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
    NSInteger weekDay = [comp weekday];
        // 得到：今天是几号
    NSInteger day = [comp day];

    NSLog(@"weekDay:%ld  day:%ld",weekDay,day);

        // 计算当前日期和这周的星期一和星期天差的天数
    long firstDiff,lastDiff;
//    if (weekDay == [calendar firstWeekday]) {
//        firstDiff = 1;
//        lastDiff = 0;
//    }else{
        firstDiff = [calendar firstWeekday] - weekDay;
        lastDiff = [calendar firstWeekday]+6 - weekDay;
//    }
    NSLog(@"firstDiff:%ld   lastDiff:%ld",firstDiff,lastDiff);

        // 一周日期
    NSArray *dateWeeks = [self getCurrentWeeksWithFirstDiff:firstDiff lastDiff:lastDiff date:now];

        // 在当前日期(去掉了时分秒)基础上加上差的天数
    return  dateWeeks;
}

    //获取一周时间 数组
+ (NSMutableArray *)getCurrentWeeksWithFirstDiff:(NSInteger)first lastDiff:(NSInteger)last date:(NSDate*)date{

    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = first; i < last + 1; i ++) {
            //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeInterval:secondsPerDay sinceDate:date];                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号

        [eightArr addObject:dateStr];

    }
    return eightArr;
}
+(NSUInteger)getDaysOfYearMonth:(NSString*)yearmonth
{
    NSString*datestr=[yearmonth stringByAppendingString:@"-01"];
    NSDate*date=[datestr date];
    NSCalendar *calendar =[NSCalendar currentCalendar];

       NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];

       NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}
    //获取一周的号 数组
- (NSMutableArray *)getCurrentWeek_DayssWithFirstDiff:(NSInteger)first lastDiff:(NSInteger)last{

    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = first; i < last + 1; i ++) {
            //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
                                                                   //NSString *dateStr = @"5月31日";
                                                                   //        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
                                                                   //        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
                                                                   //        NSString *weekStr = [weekFormatter stringFromDate:curDate];

            //转换文案
            //        weekStr = [self transWeekName:weekStr];

            //组合时间
            //        NSString *strTime = [NSString stringWithFormat:@"%@-%@",dateStr,weekStr];
            //        [eightArr addObject:strTime];
        [eightArr addObject:dateStr];

    }
    return eightArr;
}
+(NSUInteger)getDaysOfThisMonth
{
    NSCalendar *calendar =[NSCalendar currentCalendar];

       NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];

       NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}
+(NSArray *)getFirstAndLastDayOfThisMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&firstDay interval:nil forDate:[NSDate date]];
    NSDateComponents *lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit |NSDayCalendarUnit fromDate:firstDay];
    NSUInteger dayNumberOfMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]].length;
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+dayNumberOfMonth-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}

+(NSArray *)getFirstAndLastDayOfThisYear
{
        //通过2月天数的改变，来确定全年天数
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    dateStr = [dateStr stringByAppendingString:@"-02-14"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *aDayOfFebruary = [formatter dateFromString:dateStr];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSYearCalendarUnit startDate:&firstDay interval:nil forDate:[NSDate date]];
    NSDateComponents *lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit fromDate:firstDay];
    NSUInteger dayNumberOfFebruary = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:aDayOfFebruary].length;
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+337+dayNumberOfFebruary-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];

    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}
@end
