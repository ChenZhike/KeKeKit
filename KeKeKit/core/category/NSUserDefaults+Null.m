//
//  NSUserDefaults+Null.m
// KeKeKit
//
//  Created by KeKe on 15/6/12.
//  Copyright (c) 2015年 情缘网吧网络. All rights reserved.
//

#import "NSUserDefaults+Null.h"

@implementation NSUserDefaults (Null)
-(void)setObjectWithoutNull:(id)value forKey:(NSString *)defaultName
{
    if (value&&value!=[NSNull null]) {
        [self setObject:value forKey:defaultName];
    }
    else
    {
//        [self setObject:nil forKey:defaultName];
        [self removeObjectForKey:defaultName];
    }
}
@end
