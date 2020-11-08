//
//  NSString+Parameters.m
//  FirstProject
//
//  Created by CZK on 2019/12/13.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSString+Parameters.h"

@implementation NSString (Parameters)
-(NSArray*)parseToArrayWithInputText
{
        //拆分优先级 ;>,
        //替换中文为英文
    NSArray*fuhaos=@[@";",@","];
    NSArray*fuhaos_chinese=@[@"；",@"，"];
    NSArray*result=nil;
    NSString*english_str=nil;
    for (int i=0; i<fuhaos.count; i++) {
        NSString*fuhao=fuhaos[i];
        NSString*fuhao_chinese=fuhaos_chinese[i];


        english_str=[self stringByReplacingOccurrencesOfString:fuhao_chinese withString:fuhao];
        NSRange range=[english_str rangeOfString:fuhao];
        if (range.location!=NSNotFound) {
                //末尾如果有逗号，去掉
            if ([english_str hasSuffix:fuhao]) {
                english_str=[english_str substringToIndex:english_str.length-1];
            }
            result=[english_str componentsSeparatedByString:fuhao];
            break;
        }
    }
    return result;
}
@end
