//
//  NSDate+TianShi.m
//  VoiceHelper
//
//  Created by CZK on 2019/12/7.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSDate+TianShi.h"

@implementation NSDate (TianShi)
+(BOOL)nowIsAM
{
    NSString*nowtime=getCurrentHHmmss();
    NSString*hourstr=[nowtime substringWithRange:NSMakeRange(0, 2)];
    int hour=[hourstr intValue];
    if (hour>=8&&hour<12) {
        return YES;
    }
    return NO;
}
@end
