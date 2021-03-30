//
//  NSArray+Parse.m
//  KeKeKit
//
//  Created by CZK on 2019/12/12.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSArray+Parse.h"

@implementation NSArray (Parse)
-(NSArray*)parsetToFileUrlArray
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (int i=0; i<[self count]; i++)
        {
        NSString*nowpath=[self objectAtIndex:i];
        NSURL*fileurl=[NSURL fileURLWithPath:nowpath];
        [result addObject:fileurl];
        }
    return result;
}
-(NSMutableArray*)randomSort
{
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    [muarr addObjectsFromArray:self];
    NSMutableArray*result=[[NSMutableArray alloc]init];
    while (muarr.count) {
        int index=arc4random()%(muarr.count);
        NSObject*obj=muarr[index];
        [result addObject:obj];
        [muarr removeObject:obj];
    }
    return result;
}
-(NSArray*)arrayWithTopCount:(int)count
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    int real_count=MIN([self count], count);
    for (int i=0; i<real_count; i++)
        {
        id obj=[self objectAtIndex:i];
        [result addObject:obj];
        }
    return result;
}
-(id)firstRepeatedObj
{
    id result=nil;
    NSCountedSet*cs=[[NSCountedSet alloc]initWithArray:self];
    for (NSObject*obj in self) {
        NSUInteger count=[cs countForObject:obj];
        if (count>1) {
            result=obj;
            break;
        }
    }
    return result;
}
-(NSMutableArray*)objsWithDicKey:(NSString*)key
{
NSMutableArray*result=[[NSMutableArray alloc]init];
    for (int i=0; i<self.count; i++) {
        NSDictionary*dic=self[i];
        NSObject*obj=[dic objectForKey:key];
        [result addObject:obj];
    }
    return result;
}
-(NSMutableArray*)lastobjsInSonArrs
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (int i=0; i<self.count; i++) {
        NSArray*arr=self[i];
        NSObject*obj=[arr lastObject];
        [result addObject:obj];
    }
    return result;
}
-(NSMutableArray*)noEmptyStrArr
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (NSString*str in self) {
        if (str.length>0) {
            [result addObject:str];
        }
    }
    return result;
}
-(NSMutableArray*)plusArr:(NSArray*)arr
{
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    [muarr addObjectsFromArray:self];
    [muarr addObjectsFromArray:arr];
    return muarr;
}
-(NSArray*)noWhiteEleArray
{
    NSMutableArray*result=[[NSMutableArray alloc]init];
    [result addObjectsFromArray:self];
    for (int i=0; i<self.count; i++) {
        NSString*key=self[i];
        if (key.length==0) {
            [result removeObject:key];
        }
    }
    return result;
}
@end
