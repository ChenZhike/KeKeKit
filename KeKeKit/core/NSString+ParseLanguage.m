//
//  NSString+ParseLanguage.m
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "NSString+ParseLanguage.h"

@implementation NSString (ParseLanguage)
-(NSString*)firstPinYin
{
    if ([self length] == 0) {
        return [NSString stringWithFormat:@"%c",'['];
    }

    if ([self canBeConvertedToEncoding:NSASCIIStringEncoding]) {//it is english words
        return [self substringToIndex:1];
    }

    unichar ch = [self characterAtIndex:0];
    char firstPinYin = ch;
    if (ch < 'A' || ch > 'z' || (ch > 'Z' && ch < 'a') ) {
        firstPinYin = pinyinFirstLetter(ch);
    }

    return [NSString stringWithFormat:@"%c",firstPinYin];
}
- (BOOL)isContainsEmoji;
{
    __block BOOL returnValue = NO;

    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff)
            {
            if (substring.length > 1)
                {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f)
                    {
                    returnValue = YES;
                    }
                }
            }
        else if (substring.length > 1)
            {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3)
                {
                returnValue = YES;
                }
            }
        else
            {
            if (0x2100 <= hs && hs <= 0x27ff)
                {
                returnValue = YES;
                }
            else if (0x2B05 <= hs && hs <= 0x2b07)
                {
                returnValue = YES;
                }
            else if (0x2934 <= hs && hs <= 0x2935)
                {
                returnValue = YES;
                }
            else if (0x3297 <= hs && hs <= 0x3299)
                {
                returnValue = YES;
                }
            else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
                {
                returnValue = YES;
                }
            }

        *stop = returnValue;
    }];

    return returnValue;
}
- (NSString *)emjoiText
{
    if (self.length)
        {

        NSData *data = [self dataUsingEncoding:NSNonLossyASCIIStringEncoding];
        NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
        NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
        return valueEmoj;
        }
    else
        {
        return self;
        }

}
    //正则去除标签
-(NSString *)getNOHtmlStr{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n"
                                                                                    options:0
                                                                                      error:nil];
    NSString* result=[regularExpretion stringByReplacingMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length) withTemplate:@""];
    return result;
}
@end
