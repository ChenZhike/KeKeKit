//
//  NSString+ShowFit.m
//  KeKeKit
//
//  Created by KeKe on 16/1/19.
//  Copyright © 2016年 keke. All rights reserved.
//

#import "NSString+ShowFit.h"
#import <UIKit/UIKit.h>
@implementation NSString (ShowFit)
-(CGFloat)getHeightWithFont:(UIFont*)font maxW:(CGFloat)maxW
{
    CGFloat resutltH=[self boundingRectWithSize:CGSizeMake(maxW,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height;
    return resutltH;
}
    //递归计算符合规定的文本长度
- (NSString *)cutBeyondTextInLength:(NSInteger)maxLenth
{
    size_t length = strlen([self UTF8String]);
    if (length > maxLenth)
        {
        NSString *text = [self substringToIndex:self.length - 1];
        return [text cutBeyondTextInLength:maxLenth];
        }
    else
        {
        return self;
        }
}

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font
{
    return [self textSizeIn:size font:font breakMode:NSLineBreakByWordWrapping];
}

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)afont breakMode:(NSLineBreakMode)breakMode
{
    return [self textSizeIn:size font:afont breakMode:NSLineBreakByWordWrapping align:NSTextAlignmentLeft];
}

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)afont breakMode:(NSLineBreakMode)abreakMode align:(NSTextAlignment)alignment
{
    NSLineBreakMode breakMode = abreakMode;
    UIFont *font = afont;

    CGSize contentSize = CGSizeZero;

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = breakMode;
    paragraphStyle.alignment = alignment;

    NSDictionary* attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    contentSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    contentSize = CGSizeMake((int)contentSize.width + 1, (int)contentSize.height + 1);
    return contentSize;
}
-(CGFloat)getWidthWithFont:(UIFont*)font
{
    CGFloat resutltw=[self boundingRectWithSize:CGSizeMake(WINDOWW,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width;
    return resutltw;
}
@end
