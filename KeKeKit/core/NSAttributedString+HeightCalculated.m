//
//  NSAttributedString+HeightCalculated.m
//  JinZi
//
//  Created by KeKe on 16/1/19.
//  Copyright © 2016年 fengjinbiao. All rights reserved.
//

#import "NSAttributedString+HeightCalculated.h"

@implementation NSAttributedString (HeightCalculated)
-(CGFloat)getHeightWithMaxW:(CGFloat)maxW
{
    CGFloat resultH=
    [self boundingRectWithSize:CGSizeMake(maxW,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height;
    return resultH;
}
-(CGFloat)getFlexableWidth
{
    CGFloat resultW=
    [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.width;
    return resultW;
}
+(NSAttributedString*)contentAttributeWithPerH:(CGFloat)perh text:(NSString*)text
{
    LabelStyle*ls=[LabelStyle keyAndNormalStyle];
    UIColor*textcolor=ls.textColor;
    UIFont*font=ls.font;
    NSMutableParagraphStyle* ps=[[NSMutableParagraphStyle alloc]init];
    ps.lineSpacing=perh-font.pointSize;
    ps.alignment=NSTextAlignmentLeft;
    NSMutableAttributedString*attrstr=[[NSMutableAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:ps,NSForegroundColorAttributeName:textcolor}];
    return attrstr;
}
@end
