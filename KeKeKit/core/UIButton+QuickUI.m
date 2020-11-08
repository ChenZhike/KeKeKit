    //
    //  UIButton+QuickUI.m
    //  FirstProject
    //
    //  Created by KeKe on 2019/2/13.
    //  Copyright © 2019 cmd. All rights reserved.
    //

#import "UIButton+QuickUI.h"

@implementation UIButton (QuickUI)
+(UIButton*)getAppCommonBackBtn
{
    return [self getAppCommonBackBtnwithColor:nil];
}
+(UIButton*)getAppCommonWhiteBackBtn
{
    return [self getAppCommonBackBtnwithColor:WhiteColor];
}
+(UIButton*)getAppCommonBackBtnwithColor:(UIColor*)color
{
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(20, 0, 30, 30)];
    btn.centerY=NavBtnCenterY;
    {
    NSString*imgstr=@"icon_jiantou";
    CGFloat imgW=16;
    CGFloat imgH=16;
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 0, imgW, imgH)];
    [iv centerWithView:btn];
    UIImage*image=[UIImage imageNamed:imgstr];
    if (color) {
        image=[image imageWithColor:color];
    }
    iv.image=image;
    iv.transform=CGAffineTransformMakeRotation(M_PI);
    [btn addSubview:iv];
    }
    return btn;
}
-(void)onceSelected:(BOOL)selected
{
    self.selected=selected;
    if (selected) {
        self.userInteractionEnabled=NO;
    }
}
-(void)setWithImgstr:(NSString*)imgstr
{
    if ([imgstr containsString:@"http"]) {
        [self sd_setImageWithURL:[NSURL URLWithString:imgstr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"logo192"]];
    }
    else if(imgstr.length)
        {
        [self setImage:[UIImage imageNamed:imgstr]  forState:UIControlStateNormal];
        }
    else
        {
        [self setImage:[UIImage imageNamed:@"logo192"]  forState:UIControlStateNormal];
        }
}
+(UIButton*)tijiaoBWithTitle:(NSString*)title target:(id)target sel:(SEL)sel
{
    UIButton*btn1=[[UIButton alloc]initWithFrame:RECT(0, 0, 108, 30)];
    [btn1 cornerHG2];
    btn1.centerX=WINDOWW/2;

    btn1.backgroundColor=BlackColor;
    [btn1 setTitleColor:WhiteColor forState:UIControlStateNormal];
    btn1.titleLabel.font=boldFont(12);
    [btn1 setTitle:title forState:UIControlStateNormal];

    if (target) {
        [btn1 addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    return btn1;

}
+(UIButton*)getContentAddBtn
{
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(0,0 , 95, 128)];
    [btn corner:APPCorner];
    [btn setImage:[UIImage imageNamed:@"pic_tianjai"] forState:UIControlStateNormal];
    return btn;
}
-(void)cleanImgAndSetTitle:(NSString*)title
{
    [self setImage:nil forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
}
-(void)whiteBackTextStyle
{
    self.backgroundColor=WhiteColor;
    [self setTitleColor:BlackColor forState:UIControlStateNormal];
    [self borderColr:BlackColor width:2];
}
-(void)BlackBackTextStyle
{
    self.backgroundColor=BlackColor;
    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
}
-(void)noSelectTextStyle
{
    self.backgroundColor=RGB(90, 90, 90, 1);
    self.userInteractionEnabled=NO;
    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
}
@end
