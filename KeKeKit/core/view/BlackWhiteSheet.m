//
//  BlackWhiteSheet.m
//  KeKeKit
//
//  Created by CZK on 2019/8/28.
//  Copyright © 2019 czk. All rights reserved.
//

#import "BlackWhiteSheet.h"

@implementation BlackWhiteSheet
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch*touch=[touches anyObject];
    CGPoint location=[touch locationInView:self];
    if (CGRectContainsPoint(self.btnsBackView.frame, location)==NO) {
         [self removeFromSuperview];
    }

}
-(id)initWithTitles:(NSArray*)titles
{
    if (self=[super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor=[BlackColor colorWithAlphaComponent:0.28];
        self.titles=titles;
        NSMutableArray*muarr=[[NSMutableArray alloc]init];
        self.btns=muarr;
        [self initCancelB];
        [self initBtns];
        [self.cancelB corner:APPCorner];
        [self.btnsBackView corner:APPCorner];


    }
    return self;
}
-(CGFloat)btnh
{
    return 39;
}
-(CGFloat)btncancel_top
{
    return 6;
}
-(void)initBtns
{
    NSArray*titles=self.titles;
    int count=titles.count;
    CGFloat btnh=[self btnh];
    CGFloat startY=self.cancelB.top-(count*btnh+[self btncancel_top]);
    CGFloat btnx=LeftMargin;
    CGFloat btnw=WINDOWW-btnx*2;
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(btnx, startY, btnw, btnh*count);
    backView.backgroundColor=[UIColor whiteColor];

    for (int i=0; i<count; i++) {
        NSString*title=titles[i];
        UIButton*btn=[self geAbtnWithFrame:RECT(0, btnh*i, btnw, btnh) title:title];
        btn.tag=i;
        [backView addSubview:btn];
        startY+=btnh;
        [self.btns addObject:btn];
    }
    [self addSubview:backView];
    self.btnsBackView=backView;

}
-(UIButton*)geAbtnWithFrame:(CGRect)frame title:(NSString*)title
{
    UIButton*btn=[[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor=WhiteColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:BlackColor forState:UIControlStateNormal];
    btn.titleLabel.font=font(13);
    [btn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
-(void)initCancelB
{
    CGFloat btnh=[self btnh];
    CGFloat startY=WINDOWH-kHomeBarHeight-btnh;
    CGFloat btnx=LeftMargin;
    CGFloat btnw=WINDOWW-btnx*2;
    UIButton*btn=[self geAbtnWithFrame:RECT(btnx, startY, btnw, btnh) title:@"取消"];
    [self addSubview:btn];
    self.cancelB=btn;
}
-(void)cancelClick
{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
