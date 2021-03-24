//
//  AdvertiseView.m
//   BaobaoZhidao
//
//  Created by KeKe on 3018/9/1.
//  Copyright © 3018年 Dushu Ou. All rights reserved.
//

#import "AdvertiseView.h"

@implementation AdvertiseView
-(id)init
{
    if (self=[super init]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
-(void)initUI
{
    UILabel*lab=[[UILabel alloc]initWithFrame:RECT(0, 0, WINDOWW, 21*1.2)];
    lab.font=[UIFont systemFontOfSize:21];
    lab.numberOfLines=0;
    lab.textAlignment=NSTextAlignmentCenter;
    lab.text=@"如有身体不适，及时就医";
//    lab.adjustsFontSizeToFitWidth=YES;
    lab.center=CGPointMake(WINDOWW/2, WINDOWH*0.35);
    [self addSubview:lab];

    CGSize imgsize=CGSizeMake(WINDOWW*0.6*867/1024, WINDOWW/2*867/1024);
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 0, imgsize.width, imgsize.height)];
    iv.image=[UIImage imageNamed:@"shoupengxin"];
    iv.center=CGPointMake(WINDOWW/2, lab.bottom+imgsize.height/2);
    [self addSubview:iv];

    UILabel*lab1=[[UILabel alloc]initWithFrame:RECT(0, 0, WINDOWW, 15*1.2)];
    lab1.font=[UIFont systemFontOfSize:15];
    lab1.numberOfLines=0;
    lab1.textAlignment=NSTextAlignmentCenter;
    lab1.text=@"一切内容来自于网络";
//    lab1.adjustsFontSizeToFitWidth=YES;
    lab1.center=CGPointMake(WINDOWW/2, WINDOWH*0.8);
    [self addSubview:lab1];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
