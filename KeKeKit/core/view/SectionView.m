    //
    //  SectionView.m
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/15.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import "SectionView.h"

@implementation SectionView
+(CGFloat)Height
{
    return 15;
}
-(id)initWithTitle:(NSString*)title withMore:(BOOL)withMore
{
    return [self initWithImgStr:nil title:title withMore:withMore];
}
-(id)initWithImgStr:(NSString*)imgstr title:(NSString*)title withMore:(BOOL)withMore
{
    if (self=[super init]) {
        self.backgroundColor=WhiteColor;
        CGFloat height=[[self class]Height];
        self.frame=RECT(0, 0, WINDOWW, height);
        CGFloat cy=height/2;
        UIImageView*iv;
        if(imgstr)
            {//频道
                UIImage*image=[UIImage imageNamed:imgstr];
                iv=[[UIImageView alloc]initWithFrame:RECT(10, 0, image.size.width/2, image.size.height/2)];
                iv.centerY=cy;
                iv.image=image;
            }
        else
            {//首页
                iv=[[UIImageView alloc]initWithFrame:RECT(10, 0, 2, 13)];
                iv.centerY=cy;
                iv.backgroundColor=APPRedOrangeColor;
            }
        [self addSubview:iv];




        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(iv.right+5, 0, 100, iv.height)];
        alab.centerY=cy;
        alab.font=font(15);
        alab.textColor=[UIColor blackColor];
        alab.text=title;
        alab.textAlignment=NSTextAlignmentLeft;

        [self addSubview:alab];

        if (withMore) {
            NSString*imgstr=@"more";
            UIImage*image=[[UIImage imageNamed:imgstr]imageWithColor:ThreeColor];
            CGFloat imgW=7;
            CGFloat imgH=13;
            UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(WINDOWW-14-imgW, 0, imgW, imgH)];
            iv.image=image;
            iv.centerY=alab.centerY;

            [self addSubview:iv];
            UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(iv.x-60-2, 0, 60, 14)];
            alab.centerY=cy;
            alab.font=font(14);
            alab.textColor=ThreeColor;
            alab.text=@"更多";
            alab.textAlignment=NSTextAlignmentRight;

            [self addSubview:alab];
        }
    }
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
