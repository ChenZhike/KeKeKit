//
//  FreeBtn.m
//  Xiu
//
//  Created by CZK on 2018/11/28.
//  Copyright © 2018 czk. All rights reserved.
//

#import "FreeBtn.h"

@implementation FreeBtn
+(FreeBtn*)flextWidthBtnWithHeight:(CGFloat)height ivStr:(NSString*)ivStr attributeTitle:(NSAttributedString*)attributeTitle innserspace:(CGFloat)innserspace screenspace:(CGFloat)screenspace
{

    NSString*imgstr=ivStr;

    UIImage*image=[UIImage imageNamed:imgstr];

    UIImageView*iv=[[UIImageView alloc]initWithImage:image];
    [iv autoSetXuanZhongImg:imgstr];
    iv.x=screenspace;
    iv.centerY=height/2;
    iv.image=image;



    CGFloat lab_w=[attributeTitle getFlexableWidth];
    CGFloat lab_h=[attributeTitle getHeightWithMaxW:lab_w];
    UILabel*alab=[[UILabel alloc]initWithFrame:cyFrame(iv.right+innserspace, iv.centerY, lab_w, lab_h)];
    alab.attributedText=attributeTitle;

    FreeBtn*result=[[FreeBtn alloc]initWithFrame:RECT(0, 0,alab.right+screenspace, height)];
    result.iv=iv;
    [result addSubview:iv];

    result.lab=alab;
    [result addSubview:alab];
    return result;
}
-(id)initWithRect:(CGRect)rect Title:(NSString*)title labstyle:(LabelStyle*)ls
            titleFrame:(CGRect)titleFrame  ivStr:(NSString*)ivStr  ivFrame:(CGRect)ivFrame
{
    if (self=[super initWithFrame:rect]) {
        UILabel*alab=[[UILabel alloc]initWithFrame:titleFrame];
        alab.font=ls.font;
        alab.textColor=ls.textColor;
        alab.text=title;
        alab.textAlignment=ls.textAlignment;
        self.lab=alab;
        [self addSubview:alab];

        NSString*imgstr=ivStr;
        UIImageView*iv=[[UIImageView alloc]initWithFrame:ivFrame];
        UIImage*image=[UIImage imageNamed:imgstr];
        iv.image=image;
        self.iv=iv;

        [self addSubview:iv];

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
