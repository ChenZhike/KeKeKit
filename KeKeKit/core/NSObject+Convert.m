//
//  NSObject+Convert.m
//  KeKeKit
//
//  Created by CZK on 2019/4/13.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSObject+Convert.h"

@implementation NSObject (Convert)
-(NSNumber*)mustNum
{
  NSNumber*final=  [self isKindOfClass:[NSNumber class]]?(NSNumber*)self:@([(NSString*)self intValue]);
    return final;
}
-(NSString*)numOrStringValue
{
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)self stringValue];
    }else
        {
        return (NSString*)self;
        }
}
@end
