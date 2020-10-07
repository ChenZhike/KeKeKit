//
//  UITextField+PlaceHolderColor.m
// FirstProject
//
//  Created by KeKe on 15/8/10.
//  Copyright (c) 2015年 KeKeKit. All rights reserved.
//

#import "UITextField+PlaceHolderColor.h"

@implementation UITextField (PlaceHolderColor)
-(void)simplePlaceColorWithStr:(NSString*)str color:(UIColor*)placeColor
{
    NSMutableAttributedString*attrstr=[[NSMutableAttributedString alloc]initWithString:str];
    [attrstr addAttribute:NSForegroundColorAttributeName value:placeColor range:NSMakeRange(0, str.length)];
    [attrstr addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, str.length)];
    self.attributedPlaceholder=attrstr;
}
-(void)fillLS:(LabelStyle*)ls
{
    self.textColor=ls.textColor;
    self.font=ls.font;
    self.textAlignment=ls.textAlignment;
}
-(UIView*)addXiaLaRightView
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, 30, self.height);
    [backView addSmallImg:@"icon_xuanxiang" w:9 h: 4];

    self.rightView=backView;
    self.rightViewMode=UITextFieldViewModeAlways;
    return backView;
}
-(UIView*)addSmallRightImg:(NSString*)imgstr
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, self.height, self.height);
    UIImage*img=[UIImage imageNamed:imgstr];
    [backView addSmallImg:imgstr w:img.size.width h: img.size.height];
    self.rightView=backView;
    self.rightViewMode=UITextFieldViewModeAlways;
    return backView;
}
-(BOOL)isPlaceStyle
{
    BOOL result_no= (self.text.length>0)&&(self.textColor!=PlaceColor);
    return !result_no;
}
@end
