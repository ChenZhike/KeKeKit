    //
    //  NSString+Date.h
    //  VoiceHelper
    //
    //  Created by CZK on 2019/12/6.
    //  Copyright © 2019 czk. All rights reserved.
    //

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Date)

/**
 把yyyy-MM-dd HH:mm:ss变成date

 @return return value description
 */
-(NSDate*)parseDateTimeStrToDate;

/**
 yyyy-MM-dd 变成date

 @return return value description
 */
-(NSDate*)date;
-(NSString*)getLastYearMonthStr;
/**
 自身是yyyy-MM

 @return yyyy-MM
 */
-(NSString*)getNextYearMonthStr;

/**
 从今天到指定天一共多少天

 @param datestr2 yyyy-MM-dd
 @return 天数，包含首尾
 */
-(NSInteger)daysWithFinalDatestr2:(NSString*)datestr2;

    // 得到：今天是星期几
    // 0(星期天) 1(星期一) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六)
- (NSInteger)weekDayOfDateStr;
    //yyyy-MM-dd 变成yyyy.MM.dd
-(NSString*)dianDateStyle;
/**
 获得自身yyyy-MM 在中国星期里的索引

 @return 0，周一,1周二，...6,周日
 */
- (NSInteger)chineseWeekDayIndexOfDateStr;

/**
 从某天开始当周还有几天

 @return 天数
 */
- (NSInteger)daysInAWeekStartWithDateStr;
/**
 从某天后当周还有几天

 @return 天数
 */
- (NSInteger)daysInAWeekBeforeDateStr;
/**
 获取是几号

 @return  获取是几号
 */
- (NSInteger)getDayFromDateStr;
@end

NS_ASSUME_NONNULL_END
