//
//  NSString+Common.h
//
//  Created by Alexi on 12-11-5.
//  Copyright (c) 2012年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface NSString (Edit)

    //是否为空
+ (BOOL)isEmpty:(NSString *)string;


+ (NSString *)encodeToPercentEscapeString:(NSString *) input;
+ (NSString *)decodeFromPercentEscapeString:(NSString *)input;

//当前字符串是否只包含空白字符和换行符
- (BOOL)isWhitespaceAndNewlines;

//去除字符串前后的空白,不包含换行符
- (NSString *)trim;

//去除字符串中所有空白
- (NSString *)removeWhiteSpace;
- (NSString *)removeNewLine;



/*!
 @brief     大写第一个字符
 @return    格式化后的字符串
 */
- (NSString *)capitalize;

//以给定字符串开始,忽略大小写
- (BOOL)startsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串开始
- (BOOL)startsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;


//以给定字符串结束，忽略大小写
- (BOOL)endsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串结尾
- (BOOL)endsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//包含给定的字符串, 忽略大小写
- (BOOL)containsString:(NSString *)str;
//以指定条件判断是否包含给定的字符串
- (BOOL)containsString:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//判断字符串是否相同，忽略大小写
- (BOOL)equalsString:(NSString *)str;

- (NSString *)valueOfLabel:(NSString *)label;

- (NSString *)substringAtRange:(NSRange)rang;

- (NSUInteger)utf8Length;

-(NSArray*)seperatedPerGroup:(int)group;

-(NSString*)subStrBetweenStr1:(NSString*)str1 str2:(NSString*)str2;

-(NSString*)substringAfterStr:(NSString*)str;
-(NSString*)substringWithStartIndex:(int)startindex endindex:(int)endindex;
-(NSString *)deleteSpecialCharacters;
-(NSString*)deleteLastToken;
-(BOOL)hasTokenSuffix;
@end
