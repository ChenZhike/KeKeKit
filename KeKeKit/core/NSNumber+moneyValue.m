//
//  NSNumber+moneyValue.m
//  JinZi
//
//  Created by KeKe on 15/12/23.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import "NSNumber+moneyValue.h"

@implementation NSNumber (moneyValue)
-(NSString*)moneyValue
{
    NSString*resultStr=[NSString stringWithFormat:@"%.2f",[self floatValue]];
    return resultStr;
}
-(NSString*)adjuestIntFloatValue
{
    NSString*resultStr=[NSString stringWithFormat:@"%.2f",[self floatValue]];
    if ([resultStr hasSuffix:@".00"]) {
        resultStr=[NSString stringWithFormat:@"%d",[self intValue]];
    }
    return resultStr;
}
@end
