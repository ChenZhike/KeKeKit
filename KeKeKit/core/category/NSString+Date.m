    //
    //  NSString+Date.m
    //  VoiceHelper
    //
    //  Created by CZK on 2019/12/6.
    //  Copyright © 2019 czk. All rights reserved.
    //

#import "NSString+Date.h"

@implementation NSString (Date)
-(NSDate*)parseDateTimeStrToDate
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd HH:mm:ss";
    [formate setDateFormat:formateString ];
    NSDate*dt=[formate dateFromString:self];
    return dt;
}
-(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *result = [dateFormatter dateFromString:self];
    return result;
}
-(NSString*)getNextYearMonthStr
{
    int year=[[self substringWithRange:NSMakeRange(0, 4)]intValue];
    int month=[[self substringWithRange:NSMakeRange(5, 2)]intValue];
    int next_month=month+1;
    int next_year=year;
    if (month==12) {
        next_month=1;
        next_year++;
    }
    NSString*monthstr=[NSString stringWithFormat:@"%d",next_month];
    if (next_month<10) {
        monthstr=[NSString stringWithFormat:@"0%d",next_month];
    }
    NSString*result=[NSString stringWithFormat:@"%d-%@",next_year,monthstr];
    return  result;
}
-(NSString*)getLastYearMonthStr
{
    int year=[[self substringWithRange:NSMakeRange(0, 4)]intValue];
    int month=[[self substringWithRange:NSMakeRange(5, 2)]intValue];
    int last_month=month-1;
    int last_year=year;
    if (month==0) {
        last_month=12;
        last_year--;
    }
    NSString*monthstr=[NSString stringWithFormat:@"%d",last_month];
    if (last_month<10) {
        monthstr=[NSString stringWithFormat:@"0%d",last_month];
    }
    NSString*result=[NSString stringWithFormat:@"%d-%@",last_year,monthstr];
    return  result;
}
-(NSInteger)daysWithFinalDatestr2:(NSString*)datestr2
{
    NSInteger result=0;
        //创建两个日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:self];
    NSDate *endDate = [dateFormatter dateFromString:datestr2];

        //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传：
     *    NSCalendarUnitDay : 天
     *    NSCalendarUnitYear : 年
     *    NSCalendarUnitMonth : 月
     *    NSCalendarUnitHour : 时
     *    NSCalendarUnitMinute : 分
     *    NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
                                            //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
        //打印
    NSLog(@"%@",delta);
        //获取其中的"天"
    NSLog(@"%ld",delta.day);
    result=delta.day+1;//首尾都带上的话需要加1，默认不带末尾的那一天
    return result;
}
- (NSInteger)weekDayOfDateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [dateFormatter dateFromString:self];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
        // 得到：今天是星期几
        // 1(星期天) 2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六)
    NSInteger weekDay = [comp weekday]-1;//为了统一，索引都改成从0开始
    return weekDay;
}
- (NSInteger)chineseWeekDayIndexOfDateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [dateFormatter dateFromString:self];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
        // 得到：今天是星期几
        // 1(星期天) 2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六)
    NSInteger weekDay = [comp weekday]-1;//为了统一，索引都改成从0开始
    weekDay=[@(weekDay) getChineseWeekdayWithSunday_weekday_index];
    return weekDay;
}
-(NSString*)dianDateStyle
{
    NSString*result= [self stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    return result;
}
- (NSInteger)daysInAWeekStartWithDateStr
{
    NSInteger firstday_weekday=[self chineseWeekDayIndexOfDateStr];

    int days_aweek=7;
    NSInteger firstday_weekdays=days_aweek-firstday_weekday;
    return firstday_weekdays;
}
- (NSInteger)daysInAWeekBeforeDateStr
{
    NSInteger endday_weekday=[self chineseWeekDayIndexOfDateStr];
    NSInteger endday_weekdays=endday_weekday+1;
    return endday_weekdays;
}
- (NSInteger)getDayFromDateStr
{
    int day= [[self substringFromIndex:8]intValue];
    return day;
}
@end
