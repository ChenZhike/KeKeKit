//
//  UIColor+HexStr.m
// KeKeKit
//
//  Created by KeKe on 15/8/6.
//  Copyright (c) 2015年 KeKeKit. All rights reserved.
//

#import "UIColor+HexStr.h"

@implementation UIColor (HexStr)
-(NSString*)hexStr
{
    CGFloat red,green,blue,alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    NSMutableString*astr=[[NSMutableString alloc]initWithString:@""];
    int redint,greenint,blueint;
    redint=red*255*alpha;
    greenint=green*255*alpha;
    blueint=blue*255*alpha;
    NSString*redStr=[self ToHex:redint];
    if (redStr.length==1) {
        redStr=[NSString stringWithFormat:@"0%@",redStr];
    }
    NSString*greenStr=[self ToHex:greenint];
    if (greenStr.length==1) {
        greenStr=[NSString stringWithFormat:@"0%@",greenStr];
    }
    NSString*blueStr=[self ToHex:blueint];
    if (blueStr.length==1) {
        blueStr=[NSString stringWithFormat:@"0%@",blueStr];
    }
    [astr appendString:redStr];
    [astr appendString:greenStr];
    [astr appendString:blueStr];
    return astr;
}
//十六进制转RGB
+ (UIColor *)colorWithHex:(NSString *)hexString
{
    if (!hexString || hexString.length==0)
    {
        return nil;
    }
    
    long red = strtoul([[hexString substringWithRange:NSMakeRange(0, 2)] UTF8String],0,16);
    long green = strtoul([[hexString substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16);
    long blue = strtoul([[hexString substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16);
    UIColor *color=[UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    
    return color;
}
-(NSString *)ToHex:(int)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    return str;
}
@end
