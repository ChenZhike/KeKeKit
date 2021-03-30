//
//  NSNumber+Calcutate.m
//  KeKeKit
//
//  Created by CZK on 2019/1/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSNumber+Calcutate.h"
#define CommonMargin_shipei(a) (a?(WINDOWW/375):1)
@implementation NSNumber (Calcutate)
-(int)zhengchuplus:(int)b
{
    int a=[self intValue];
    BOOL zhengchu=(a%b==0);
    int value=a/b;
    if (!zhengchu) {
        value++;
    }
    return value;
}
-(NSInteger)getChineseWeekdayWithSunday_weekday_index
{
        //周日为0，中文日历里索引为6
        //周一为1，中文日历里索引为0
        //...
        //周六为6，中文日历里索引为5
    NSInteger sunday_weekday_index=[self integerValue];
    if (sunday_weekday_index==0) {
        return 6;
    }else {
        return sunday_weekday_index-1;
    }
}
-(CGFloat)shipeiValue:(BOOL)isShipei
{
    CGFloat old=[self floatValue];
    CGFloat value=old*CommonMargin_shipei(isShipei);
    return value;
}
-(NSArray*)indexsZuHesWithMaxNum:(int)maxNum
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (int i=0; i<maxNum; i++) {
        NSArray*arr=[self indexsZuHesWithPickNum:i];
        [result addObject:arr];
    }

    return result;
}
-(NSArray*)indexsZuHesWithPickNum:(int)pickNum
{

    int count =[self intValue];
    if (pickNum>count) {
        return nil;
    }else
    if (pickNum==count) {
        NSMutableArray*result=[[NSMutableArray alloc]init];
        for (int i=0; i<pickNum; i++) {
            [result addObject:@(i)];
        }
        return result;
    }
    else
    if (pickNum<count)
        {
        if (pickNum==1) {
                NSMutableArray*result=[[NSMutableArray alloc]init];
            for (int j=0; j<count; j++) {
                [result addObject:@[@(j)]];
            }
            return result;
        }
        else
        if (pickNum==2) {
            NSMutableArray*result=[[NSMutableArray alloc]init];
            for (int j=0; j<count-(pickNum-1); j++) {

                for (int k=j+1; k<count; k++) {
                    NSMutableArray*aele=[[NSMutableArray alloc]init];
                    [aele addObject:@(j)];
                    [aele addObject:@(k)];
                    [result addObject:aele];
                }
            }
        }else
        if (pickNum>=3)
        {
        NSMutableArray*result=[[NSMutableArray alloc]init];
        for (int j=0; j<count-(pickNum-1); j++) {
            //j是第一个

                //当前固定
            NSNumber*now=@(j);

            //变的是：
            //从后面的当中挑pickNum-1个=从自己数-(j+1)时当中挑pickNum-1个，然后每个数值都加上j+1
            NSArray*just_indexs=[@(count-(j+1)) indexsZuHesWithMaxNum:(pickNum-1)];
            NSMutableArray*right_indexs=[[NSMutableArray alloc]init];
                for (NSArray*old_indexs in just_indexs) {
                    NSMutableArray*now_aele=[[NSMutableArray alloc]init];
                    for (NSNumber*old_num in old_indexs) {
                        [now_aele addObject:@([old_num intValue]+j+1)];
                    }
                    [right_indexs addObject:now_aele];
                }
            for (NSArray*indexs in right_indexs) {
              NSMutableArray*ele=[[NSMutableArray alloc]init];
                [ele addObject:now];
                [ele addObjectsFromArray:indexs];
            }

        }
            return result;
        }
        }
    return nil;

}
@end
