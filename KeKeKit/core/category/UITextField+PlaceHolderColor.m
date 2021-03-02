    //
    //  UITextField+PlaceHolderColor.m
    // KeKeKit
    //
    //  Created by KeKe on 15/8/10.
    //  Copyright (c) 2015年 KeKeKit. All rights reserved.
    //

#import "UITextField+PlaceHolderColor.h"
#import "SVProgressHUD.h"
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
-(UIView*)addLeftSpaceView
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, self.height/2, self.height);

    self.leftView=backView;
    self.leftViewMode=UITextFieldViewModeAlways;
    return backView;
}
-(BOOL)checkEmpty
{
    if (self.text.length==0) {
        NSString*tishiwords=self.placeholder;
        [SVProgressHUD showErrorWithStatus:tishiwords];
        return NO;
    }
    return YES;
}
@end
