//
//  NSArray+IndexOutOfCount.m
//  KeKeKit
//
//  Created by KeKe on 15/12/16.
//  Copyright © 2015年 keke. All rights reserved.
//

#import "NSArray+IndexOutOfCount.h"

@implementation NSArray (IndexAndStr)
-(id)objectAtIndexInArr:(NSUInteger)index
{
    if (index<self.count) {
        return [self objectAtIndex:index];
    }
    else
    {
        LOG(@"数组越界了:%@",self);
    }
    return nil;
}
-(NSString*)concactToAskSentence
{
    NSMutableString*resultmu=[[NSMutableString alloc]init];
    for (NSString*str in self) {
        if ([self indexOfObject:str]<=self.count-2) {
            [resultmu appendString:str];
            [resultmu appendString:@","];
        }
        else if ([self indexOfObject:str]==self.count-1)
            {
            [resultmu appendString:[NSString stringWithFormat:@"还是%@？",str]];
            }
    }

    return resultmu;
}
-(NSString*)concactStrsWithStr:(NSString*)seperator
{
    NSMutableString*resultmu=[[NSMutableString alloc]init];
    for (NSString*str in self) {
            [resultmu appendString:str];
        if ([self indexOfObject:str]<=self.count-2) {

            [resultmu appendString:seperator];
        }
    }

    return resultmu;
}
-(NSArray*)allAddPrefix:(NSString*)prefix
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (NSString*str in self) {
        NSString*str1=[NSString stringWithFormat:@"%@%@",prefix,str];
        [result addObject:str1];
    }
    return result;
}
@end
