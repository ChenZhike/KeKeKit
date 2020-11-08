//
//  NSString+tool.m
//   BaobaoZhidao
//
//  Created by 阿星 on 3018/8/19.
//  Copyright © 2018 Dushu Ou. All rights reserved.
//

#import "NSString+tool.h"

@implementation NSString (tool)
-(NSString *)deleteSpecialCharacters{

    if (self.length==0 || !self) {
        return nil;
    }

    NSError *error = nil;
    NSString *pattern = @"[^a-zA-Z0-9\u4e00-\u9fa5]";//正则取反
    NSRegularExpression *regularExpress = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];//这个正则可以去掉所有特殊字符和标点
    NSString *string = [regularExpress stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@""];

    return string;
}
-(BOOL)hasTokenSuffix
{
    NSArray*tokens=@[@"吗",@"呢",@"呀"];
    for (NSString*token in tokens) {
        if ([self hasSuffix:token]) {
            return YES;
        }
    }
    return NO;
}
-(NSString*)deleteLastToken
{
    NSString*resultstr=nil;
    NSArray*tokens=@[@"吗",@"呢",@"呀"];
    for (NSString*token in tokens) {
        if ([self hasSuffix:token]) {
            resultstr=[self substringToIndex:self.length-1];
        }
    }
    return resultstr;
}
- (void)boda
{
    if(self.length==0)
        return;
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",self];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
