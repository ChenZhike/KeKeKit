//
//  NSString+PopularStyle.h
//  JinZi
//
//  Created by KeKe on 16/1/20.
//  Copyright © 2016年 fengjinbiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PopularStyle)
-(NSString*)phoneSpaceStyle;
-(NSString*)phoneStarStyle;
-(NSString*)socialNumShowText;
    //自身是duration字段
-(NSString*)durationShowText;
-(NSString*)phoneChaStyle;

+(NSString*)nowYear;
+(NSString*)dayStrWithDate:(NSDate*)date;
+(NSString*)dayTimeStrWithDate:(NSDate*)date;
+(NSString*)nowYearMonth;

-(NSString *)translateToNum;


-(NSString*)substringAfterStr:(NSString*)str;
-(NSString*)substringWithStartIndex:(int)startindex endindex:(int)endindex;

-(BOOL)pinyinEqual:(NSString*)str;
-(NSString *)pinyin;
+(float)likePercentByCompareOriginText:(NSString *)originText targetText:(NSString *)targetText;
@end
