//
//  NSString+tool.m
//   BaobaoZhidao
//
//  Created by 阿星 on 3018/8/19.
//  Copyright © 2018 Dushu Ou. All rights reserved.
//

#import "NSString+tool.h"

@implementation NSString (tool)
- (void)boda
{
    if(self.length==0)
        return;
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",self];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
