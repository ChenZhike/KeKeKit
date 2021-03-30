//
//  IVLabel.m
//  KeKeKit
//
//  Created by KeKe on 3018/9/15.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import "IVLabel.h"
#import "IVLabModel.h"
@implementation IVLabel
-(void)fillSubViewsWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle
                           Datas:(IVLabModel*)data
{
    CGFloat ivW=(ilwLayout.maxW-ilwLayout.leftMarginW-ilwLayout.rightMarginW-(ilwLayout.perLineDataNum-1)*ilwLayout.innerspaceMarginW)/ilwLayout.perLineDataNum;
    NSString*imgstr=data.keyimgurl;
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, ilhLayout.ivtopMargin, ivW, ilhLayout.ivPofHW*ivW)];
    self.iv=iv;
        //    iv.backgroundColor=[UIColor greenColor];

    if ([imgstr containsString:@"http"]) {
        [iv sd_setImageWithURL:[NSURL URLWithString:imgstr]placeholderImage:[UIImage imageNamed:@"video_cover"]];
    }
    else
        {
        [iv setImage:[UIImage imageNamed:imgstr]];
        }

    [self addSubview:iv];

    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(iv.x, iv.bottom+ilhLayout.innerspaceMarginH, ivW, alabStyle.font.pointSize)];
    alab.adjustsFontSizeToFitWidth=YES;
    alab.font=alabStyle.font;
    alab.textColor=alabStyle.textColor;
    alab.text=data.text;
    alab.textAlignment=alabStyle.textAlignment;
    [self addSubview:alab];
    self.l=alab;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
