    //
    //  LabelStyle.m
    //  FirstProject
    //
    //  Created by CZK on 3018/10/23.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import "LabelStyle.h"

@implementation LabelStyle
+(LabelStyle*)keyAndNormalStyle
{
    LabelStyle*ls=[[LabelStyle alloc]init];
    UIFont*font=font(12);
    ls.font=font;
    ls.textColor=BlackColor;
    ls.textAlignment=NSTextAlignmentLeft;
    return ls;
}
+(LabelStyle*)wordTitlestyle
{
    LabelStyle*ls=[[LabelStyle alloc]init];
    UIFont*font=boldFont(18);
    ls.font=font;
    ls.textColor=BlackColor;
    ls.textAlignment=NSTextAlignmentCenter;
    return ls;
}
@end
