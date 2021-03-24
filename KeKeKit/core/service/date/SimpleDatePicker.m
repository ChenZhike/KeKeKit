//
//  SimpleDatePicker.m
//  FirstProject
//
//  Created by CZK on 2019/12/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SimpleDatePicker.h"

@implementation SimpleDatePicker
- (instancetype)initWithSuggestedH:(CGFloat)h suggestedBotSpace:(CGFloat)suggestedBotSpace startDateStr:(NSString*)startDateStr superView:(UIView*)superView  target:(id)target receiveChangedSelStr:(NSString*)selStr
{
    self = [super initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)];
    if (self) {

        self.startDateStr=startDateStr;
        self.may_superView=superView;
        self.target=target;
        self.receiveChangedSelStr=selStr;
        self.backgroundColor=[[UIColor clearColor]colorWithAlphaComponent:0.18];
        UIView*backView=[[UIView alloc]init];
        backView.frame=RECT(0, WINDOWH-suggestedBotSpace-h, WINDOWW, h);
        [self addSubview:backView];
        self.contentView=backView;


        [self.contentView addSubview:self.cancel_sureVie];
        [self initDP];
    }
    return self;
}
-(void)initDP
{
    if (self.dp==nil) {
        UIDatePicker*result=[[UIDatePicker alloc]initWithFrame:RECT(0, self.cancel_sureVie.bottom, WINDOWW, self.contentView.height-self.cancel_sureVie.bottom)];
        result.backgroundColor=WhiteColor;
        result.datePickerMode=UIDatePickerModeDate;
        result.date=[self.startDateStr date];
        self.dp=result;
        [self.contentView addSubview:self.dp];
    }
}

//-(void)datePickerChange:(UIDatePicker*)sender
//{
//    [self getDateStrAndDismiss];
//}
-(void)getDateStrAndDismiss
{
    NSDate*date=self.dp.date;
    NSString*text=[NSString dayStrWithDate:date];
    [self.target performSelector:NSSelectorFromString(self.receiveChangedSelStr) withObject:text];
    [self dismissPick];
//    [self.dp removeFromSuperview];
}
-(UIView*)cancel_sureVie
{
    if (_cancel_sureVie==nil) {
            //初始化方法
        _cancel_sureVie=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, 40)];
        {
        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(LeftMargin, 0, 56, 36)];
            //btn.centerY=NavBtnCenterY;
        [btn cyHalf:_cancel_sureVie];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn setTitleColor:BlackColor forState:UIControlStateNormal];
        btn.titleLabel.font=font(14);
        [btn addTarget:self action:@selector(dismissPick) forControlEvents:UIControlEventTouchUpInside];
        [_cancel_sureVie addSubview:btn];
        }
        {
        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(WINDOWW-LeftMargin-56, 0, 56, 36)];
            //btn.centerY=NavBtnCenterY;
        [btn cyHalf:_cancel_sureVie];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn setTitleColor:BlackColor forState:UIControlStateNormal];
        btn.titleLabel.font=font(14);
        [btn addTarget:self action:@selector(quedingClick) forControlEvents:UIControlEventTouchUpInside];
        [_cancel_sureVie addSubview:btn];
        }
    }
    return _cancel_sureVie;
}
-(void)show
{
    [self.may_superView addSubview:self];
}
-(void)dismissPick
{
    [self removeFromSuperview];
}
-(void)quedingClick
{
    [self getDateStrAndDismiss];
}

@end
