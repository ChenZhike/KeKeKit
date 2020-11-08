//
//  NSString+Version.m
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "NSString+Version.h"

@implementation NSString (Version)
/**
 compare two version
 @param sourVersion *.*.*.*
 @param desVersion *.*.*.*
 @returns No,sourVersion is less than desVersion; YES, the statue is opposed
 */
+(BOOL)compareVerison:(NSString *)sourVersion withDes:(NSString *)desVersion
{
    NSArray * sourArr = [sourVersion componentsSeparatedByString:@"."];
    NSArray * desArr = [desVersion componentsSeparatedByString:@"."];
    int sourInt, desInt;
    NSMutableString * sourStr = [[NSMutableString alloc] init];
    NSMutableString * desStr = [[NSMutableString alloc] init];

    if ([sourArr count] < [desArr count])
        {
        return YES;
        }
    else
        {

        }

    for (int i = 0; i < [sourArr count]; i ++)
        {
        [sourStr appendFormat:@"%@", [sourArr objectAtIndex:i]];
        [desStr appendFormat:@"%@", [desArr objectAtIndex:i]];
        }
    sourInt = [sourStr intValue];
    desInt = [desStr intValue];
    if (sourInt < desInt)
        {
        return YES;
        }
    else
        {
        return NO;
        }
    return NO;

}
@end
