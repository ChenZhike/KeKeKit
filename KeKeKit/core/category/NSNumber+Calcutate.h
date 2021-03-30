//
//  NSNumber+Calcutate.h
//  KeKeKit
//
//  Created by CZK on 2019/1/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Calcutate)
-(int)zhengchuplus:(int)intvalue;
-(NSInteger)getChineseWeekdayWithSunday_weekday_index;//weekDayOfDateStr的结果作为输入,或者系统返回的基础上-1
-(CGFloat)shipeiValue:(BOOL)isShipei;
-(NSArray*)indexsZuHesWithMaxNum:(int)maxNum;
-(NSArray*)indexsZuHesWithPickNum:(int)pickNum;
@end

NS_ASSUME_NONNULL_END
