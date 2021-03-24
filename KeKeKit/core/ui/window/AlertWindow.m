//
//  AlertWindow.m
//  FirstProject
//
//  Created by KeKe on 3018/9/27.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "AlertWindow.h"

@implementation AlertWindow
-(id)initWithType:(AlertWindowType)type{
    NSArray*titles=@[@"今日的观影次数已耗尽，邀请好友就能获得更多观影次数啦！",@"今日的缓存次数已耗尽，邀请好友就能获得更多缓存次数啦！",@"用户等级2级才可发表评论，邀请好友就可以升级啦！"];
    return  [self initWithTitle:titles[type]];
}
-(id)initWithTitle:(NSString*)title
{
    if(self =[super initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)])
        self.windowLevel=UIWindowLevelNormal;
        {
        self.backgroundColor=[UIColor clearColor];

        UIView*backView=[[UIView alloc]init];
        backView.frame=RECT(44, 0, WINDOWW-88, 156);
        backView.centerY=WINDOWH/2;
        backView.layer.cornerRadius=6;
        backView.clipsToBounds=YES;
        backView.backgroundColor=[UIColor whiteColor];
        [self addSubview:backView];

        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(backView.width-28, 12, 16, 16)];
        [btn setImage:[UIImage imageNamed:@"dialog_close"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];


        UIFont*font=font(14);
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(42, 35, backView.width-84, 48)];
        alab.numberOfLines=0;
        alab.font=font;
        alab.textColor=[UIColor blackColor];
        alab.text=title;
        alab.textAlignment=NSTextAlignmentLeft;

        [backView addSubview:alab];

        UIButton*btn1=[[UIButton alloc]initWithFrame:RECT(0, 100, 192, 39)];
        btn1.centerX=backView.width/2;
        btn1.backgroundColor=RGB(182, 137, 86, 1);
        [btn1 setTitle:@"邀请好友" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(inviteClick) forControlEvents:UIControlEventTouchUpInside];
        btn1.layer.cornerRadius=btn1.height/2;
        btn1.clipsToBounds=YES;

        [backView addSubview:btn1];

        }
    return self;
}
-(void)show
{
    self.hidden=NO;
    KeKeAppDelegate*appdelegate=(KeKeAppDelegate*)[UIApplication sharedApplication].delegate;
    self.oldwin=appdelegate.window;
    appdelegate.window=self;
    [self makeKeyAndVisible];

}
-(void)dismiss
{
    self.windowLevel=UIWindowLevelNormal;
//    self.hidden=YES;
    KeKeAppDelegate*appdelegate=(KeKeAppDelegate*)[UIApplication sharedApplication].delegate;
    UIWindow*oldwin=self.oldwin;
    [appdelegate justWantDisappear:oldwin];
//    appdelegate.window=self.oldwin;
//    [appdelegate.window makeKeyAndVisible];
//    self.oldwin=nil;
}
-(void)inviteClick
{
    KeKeViewController*vc=self.oldwin.rootViewController; UINavigationController*navc=vc.nowVC;
    [ChangeVCManager navcpushInvite:navc];
    [self dismiss];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
