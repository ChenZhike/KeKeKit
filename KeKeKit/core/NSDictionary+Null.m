//
//  NSDictionary+Null.m
//  TestWorkSpace
//
//  Created by KeKe on 15/8/17.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "NSDictionary+Null.h"

@implementation NSDictionary (Null)
- (NSString*)StringObjectWithoutNullforKey:(id <NSCopying>)aKey
{
    NSString*resultStr=@"";
    id nowObj=[self objectForKey:aKey];
    if (nowObj==[NSNull null]||nowObj==nil) {
        return resultStr;
    }
    return nowObj;
}
- (NSNumber*)NumberObjectWithoutNullforKey:(id <NSCopying>)aKey
{
    id nowObj=[self objectForKey:aKey];
    if (nowObj==[NSNull null]||nowObj==nil) {
        return [NSNumber numberWithInt:0];
    }
    return nowObj;
}
- (int)intObjectWithoutNullforKey:(id <NSCopying>)aKey
{
    id nowObj=[self objectForKey:aKey];
    if (nowObj==[NSNull null]||nowObj==nil||(![nowObj isKindOfClass:[NSNumber class]])) {
        return 0;
    }
    return [nowObj intValue];
}
@end
