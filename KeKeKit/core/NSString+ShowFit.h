//
//  NSString+ShowFit.h
//  KeKeKit
//
//  Created by KeKe on 16/1/19.
//  Copyright © 2016年 keke. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIFont;
@interface NSString (ShowFit)
//使用默认样式
-(CGFloat)getHeightWithFont:(UIFont*)font maxW:(CGFloat)maxW;
    //递归计算符合规定的文本长度
- (NSString *)cutBeyondTextInLength:(NSInteger)maxLenth;

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment;
-(CGFloat)getWidthWithFont:(UIFont*)font;
@end
