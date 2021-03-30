//
//  NSArray+Compare.m
//  KeKeKit
//
//  Created by CZK on 2019/6/14.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSArray+Compare.h"

@implementation NSArray (Compare)
-(BOOL)insetWithArray:(NSArray*)arr
{
    BOOL ismatch=NO;
    for (NSObject*obj in self) {
        if ([arr containsObject:obj]) {
            ismatch=YES;
            break;
        }
    }
    return ismatch;
}
-(NSMutableArray*)insetArrayWithArray:(NSArray*)arr
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (NSObject*obj in self) {
        if ([arr containsObject:obj]) {
            [result addObject:obj];
        }
    }
    return result;
}
-(NSUInteger)countOfObj:(NSObject*)obj
{
        //需要去掉的元素数组
    NSMutableArray *filteredArray = [[NSMutableArray alloc]initWithObjects:obj, nil];
        //需要被筛选的数组
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    [dataArray addObjectsFromArray:self];

    /*
     方法一：利用NSPredicate
     注：NSPredicate所属Cocoa框架，在密码、用户名等正则判断中经常用到。
     类似于SQL语句
     NOT 不是
     SELF 代表字符串本身
     IN 范围运算符
     那么NOT (SELF IN %@) 意思就是：不是这里所指定的字符串的值
     */
    NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@" (SELF IN %@)",filteredArray];
        //过滤数组
    NSArray * reslutFilteredArray = [dataArray filteredArrayUsingPredicate:filterPredicate];
    return reslutFilteredArray.count;
}
-(NSComparisonResult)jilianCompareNums:(NSArray*)arr
{
    NSInteger count=self.count;
    NSComparisonResult result=NSOrderedSame;
    for (int i=0; i<count; i++) {
        NSNumber*num1=self[i];
        NSNumber*num2=arr[i];
        NSComparisonResult cr=[num1 compare:num2];
        if ((i==count-1)||(cr!=NSOrderedSame)) {
            result=cr;
            break;
        }
    }
    return result;
}
-(NSString*)nextStrWithNowStr:(NSString*)nowstr
{
        //    NSArray*bans=self.monthBans;
    NSInteger index=[self indexOfObject:nowstr];
    if (index<self.count-1) {
        index++;
    }
    else
        {
        index=0;
        }
    NSString*result=self[index];
    return result;
}
@end
