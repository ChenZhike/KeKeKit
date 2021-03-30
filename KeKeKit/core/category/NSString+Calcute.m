//
//  NSString+Calcute.m
//  KeKeKit
//
//  Created by CZK on 2019/6/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSString+Calcute.h"

@implementation NSString (Calcute)
-(NSString*)plusInt:(int)value
{

    NSString*result=[NSString stringWithFormat:@"%d",[self intValue]+value];
    return  result;
}
-(NSString*)plusFloat:(CGFloat)value
{

    NSString*result=[NSString stringWithFormat:@"%g",[self floatValue]+value];
    return  result;
}
-(int)maxLineWithFont:(UIFont*)font maxW:(CGFloat)maxW
{
    CGFloat taskText_w= [self boundingRectWithSize:CGSizeMake(maxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
    int line=taskText_w/maxW;
    if ((line*maxW)<taskText_w) {
        line++;
    }
    int huan_hang_num=([self componentsSeparatedByString:@"\n"].count)-1;
    line+=huan_hang_num;
    return line;
}
-(int)maxLine_rightContent:(BOOL)hasTopPic
{
    UIFont*font=font(12);
    int line=[self maxLineWithFont:font maxW:WINDOWW-LeftMargin-(hasTopPic?contentX_HasTopPic:contentX)];
    return line;
}
-(CGFloat)maxNeedH_rightContent:(BOOL)hasTopPic
{
    int line=[self maxLine_rightContent:hasTopPic];
    CGFloat result=line*per_para_line_h;
    return result;
}
-(int)maxLine_paraContent:(BOOL)hasTopPic
{
    UIFont*font=font(12);
    int line=[self maxLineWithFont:font maxW:WINDOWW-(hasTopPic?contentX_HasTopPic:contentX)*2];
    return line;
}
-(CGFloat)maxNeedH_paraContent:(BOOL)hasTopPic
{
    int line=[self maxLine_paraContent:hasTopPic];
    CGFloat result=line*per_para_line_h;
    return result;
}
-(CGFloat)maxNeedH_paraTotalContent:(BOOL)hasTopPic
{
    NSAttributedString*attrstr=[NSAttributedString contentAttributeWithPerH:per_para_line_h text:self];
    CGFloat result=[attrstr getHeightWithMaxW:WINDOWW-(hasTopPic?LeftMargin_HasTopPic:LeftMargin)*2];
    return result;
}
-(NSInteger)firstIndexInString:(NSString*)str
{
NSInteger result= [self rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:str]].location;
    return result;
}
-(NSDictionary*)kvDic
{
    NSInteger mao_index= [self firstIndexInString:@":："];
    NSString*key=[self substringToIndex:mao_index];
    NSString*value=[self substringFromIndex:mao_index+1];
    NSDictionary*dic=@{key:value};
    return dic;
}
@end
