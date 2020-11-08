//
//  NSString+CheckFormat.h
//  JinZi
//
//  Created by KeKe on 15/12/31.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CheckFormat)
#pragma mark-API层级部分
//是否是安全的密码
-(BOOL) isSafePassword;
//是否是有意义的数字
-(BOOL)isNumberFormat;
/**
 *  输入金额是否合法
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isMoneyFormat ;
/**
 *  判断小数点后是否小于两位
 *
 *  @param canWithoutPoint 当本身没有小数点时是否应当认为合法
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isLessThanTwoNumAfertPointWithcanWithoutPoint:(BOOL)canWithoutPoint;
#pragma mark-业务部分
/**
 *  是否是亏损预警格式
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isKuisunyujingFormat;
/**
 *  是否是收益预警格式
 *
 *  @return 真-合法，假-不合法
 */
-(BOOL)isShouyiyujingFormat;//亏损预警，收益预警，上限都是小数点前4位，小数点后2位。收益预警还需要满足>0
//判断字符串是不是float类型
-(BOOL)isFloatFormat;
-(BOOL)isIntFormat;
-(BOOL)noOkWithLaterDayStr:(NSString*)daystr;
-(NSInteger)getAppearTimesWithStr:(NSString*)str;
@end
