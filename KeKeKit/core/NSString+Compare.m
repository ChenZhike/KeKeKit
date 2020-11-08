//
//  NSString+Compare.m
//  VoiceHelper
//
//  Created by CZK on 2019/12/7.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSString+Compare.h"

@implementation NSString (Compare)
-(NSComparisonResult)compareHHMM:(NSString*)HHMM
{
    NSString*now_hhmm=self;
    NSArray*arr0=[now_hhmm seperatedPerGroup:2];
    NSArray*arr1=[HHMM seperatedPerGroup:2];
    NSComparisonResult result=[arr0 jilianCompareNums:arr1];
    return result;
}
@end
