    //
    //  NSString+CheckFormat.m
    //  KeKeKit
    //
    //  Created by KeKe on 15/12/31.
    //  Copyright © 2015年 keke. All rights reserved.
    //

#import "NSString+CheckFormat.h"

@implementation NSString (CheckFormat)
-(BOOL) isSafePassword{
    NSString *passWordRegex = @"^[0-9a-zA-Z]{6,20}$";   // 数字，字符或符号至少两种
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];

    if ([regextestcm evaluateWithObject:self] == YES)
        {
        return YES;
        }
    else
        {
        return NO;
        }

}


    //是否是有意义的数字
-(BOOL)isNumberFormat
{
    if (self.length==0) {
        return false;
    }
    NSSet*set=[NSSet setWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"-",@".",@"",nil];
        //首先，本身每个字符都在集合范围之内
        //其次,小数点的个数和位置正确
        //再其次，负号的个数和位置正确
        //首先，本身每个字符都在集合范围之内
    for (int i=0; i<self.length; i++) {
        NSString*nowStr=[self substringWithRange:NSMakeRange(i, 1)];
        if (![set containsObject:nowStr]) {
            return false;
        }
    }
        //其次,小数点的个数和位置正确
    if ([self rangeOfString:@"."].location!=NSNotFound) {
            //小数点只有一个
        NSInteger dianTimes=[self getAppearTimesWithStr:@"."];
        if (dianTimes!=1) {
            return false;
        }
            //小数点不能位于开头
        if ([self rangeOfString:@"."].location==0) {
            return false;
        }
    }
        //再其次，负号的个数和位置正确
    if ([self rangeOfString:@"-"].location!=NSNotFound) {
            //负号只有一个
        NSInteger fuTimes=[self getAppearTimesWithStr:@"-"];
        if (fuTimes!=1) {
            return false;
        }
            //负号只能位于开头
        if ([self rangeOfString:@"-"].location!=0) {
            return false;
        }
    }
    return YES;

}
-(BOOL)isMoneyFormat//是否大于0并且小数点后最多有两位
{
    if (![self isNumberFormat]) {
        return false;
    }
    BOOL checkResult=false;
        //    NSString*tishiStr=@"您输入的购买金额不合法！";
    if ([self floatValue]>0) {
        if ([self isLessThanTwoNumAfertPointWithcanWithoutPoint:YES]) {
                //            tishiStr=@"小数点后最多两位";
            if ([self floatValue]<1000000000000000) {
                return YES;
            }
        }
    }
    return checkResult;
}
-(BOOL)isFloatFormat{
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    if ([scan scanFloat:&val]&&[scan isAtEnd]) {
        return true;
    }else{
        return false;
    }
}
-(BOOL)isIntFormat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    if ([scan scanInt:&val]&&[scan isAtEnd]) {
        return true;
    }else{
        return false;
    }
}

/**
 *  判断小数点后是否小于两位
 *
 *  @param canWithoutPoint 当本身没有小数点时是否应当认为合法
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isLessThanTwoNumAfertPointWithcanWithoutPoint:(BOOL)canWithoutPoint
{
    BOOL checkResult=false;
    NSUInteger nDotLoc = [self rangeOfString:@"."].location;
    if(NSNotFound == nDotLoc )
        {
        checkResult=canWithoutPoint;
        return checkResult;
        }
    else
        {
        if ((self.length <=( nDotLoc + 3))) {
            checkResult=YES;
        }
        }
    return checkResult;
}
#pragma mark-业务专区

- (BOOL)isValidPortAddress
{
    return [self  checkIntValueRangeWithMin:1 max:65535];
}

- (BOOL)checkIntValueRangeWithMin:(int)min max:(int)max
{
    if ([self length] < 1)
        return NO;
    
    NSScanner * scanner = [NSScanner scannerWithString:self];
    if ([scanner scanInt:nil] && [scanner isAtEnd]) {
//        NSLog(@"min = %u, max = %u, value = %u %@", min, max, [value integerValue], value);
        return (min <= [self integerValue]) && ([self integerValue] <= max);
    }
    
    return NO;
}

- (NSString *)checkValidName
{

        
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([newString length] > 0) {
        NSString *str = [newString stringByTrimmingCharactersInSet:[NSCharacterSet alphanumericCharacterSet]];
        if ([str length] == 0)
            return newString;
    }
    
    return nil;
}

+ (NSString *)checkValidPhoneNumber:(NSString *)value
{
    if ([value length] == 0) {
        return nil;
    }
    
    NSString *newString = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([newString length] > 0) {
        NSString *str = [newString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        if ([str length] == 0)
            return newString;
    }

    return nil;
}
/**
 *  是否是亏损预警格式
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isKuisunyujingFormat//亏损预警，收益预警，上限都是小数点前4位，小数点后2位。亏损预警还需要满足<0
{
    BOOL checkResult=false;

    if ([self isNumberFormat]&&[self intValue]>-10000&&[self floatValue]<0&&[self isLessThanTwoNumAfertPointWithcanWithoutPoint:YES]) {
        checkResult=YES;
    }
    return checkResult;
}
/**
 *  是否是收益预警格式
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isShouyiyujingFormat//亏损预警，收益预警，上限都是小数点前4位，小数点后2位。收益预警还需要满足>0
{
    BOOL checkResult=false;

    if ([self isNumberFormat]&&[self intValue]<10000&&[self floatValue]>0&&[self isLessThanTwoNumAfertPointWithcanWithoutPoint:YES]) {
        checkResult=YES;
    }
    return checkResult;
}
-(BOOL)noOkWithLaterDayStr:(NSString*)daystr
{
    NSString*date1_str=self;
    NSString*date2_str=daystr;
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd";
    [formate setDateFormat:formateString ];
    NSDate*date1=[formate dateFromString:date1_str];
    NSDate*date2=[formate dateFromString:date2_str];
    BOOL no_ok=[date1 compare:date2]==NSOrderedDescending;
    return no_ok;
}
#pragma mark-辅助专区
-(NSInteger)getAppearTimesWithStr:(NSString*)str
{
    if (str.length==0) {
        return 0;
    }
    NSInteger resultNum=0;
    for (int i=0; i<self.length; i++) {
        NSString*nowStr=[self substringWithRange:NSMakeRange(i, 1)];
        if ([nowStr isEqualToString:str]) {
            resultNum++;
        }
    }
    return resultNum;
}
@end
