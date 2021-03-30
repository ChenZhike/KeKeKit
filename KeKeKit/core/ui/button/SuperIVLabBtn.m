//
//  SuperIVLabBtn.m
//  KeKeKit
//
//  Created by CZK on 2019/5/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperIVLabBtn.h"

@implementation SuperIVLabBtn
-(id)initWithRect:(CGRect)rect Titles:(NSArray*)titles labstyles:(NSArray*)lss
       titleFrame:(CGRect)titleFrame  ivStrs:(NSArray*)ivStrs
       tintcolors:(NSArray*)tintcolors
          ivFrame:(CGRect)ivFrame
{
    if (self=[super initWithFrame:rect]) {
        self.titles=titles;
        self.lss=lss;
        self.ivStrs=ivStrs;
        self.tintcolors=tintcolors;
        UILabel*alab=[[UILabel alloc]initWithFrame:titleFrame];
        LabelStyle*ls=lss[0];
        alab.font=ls.font;
        alab.textColor=ls.textColor;
        alab.text=titles[0];
        alab.textAlignment=ls.textAlignment;
        self.lab=alab;
        [self addSubview:alab];

        NSString*ivStr=ivStrs[0];
        NSString*imgstr=ivStr;
        UIImageView*iv=[[UIImageView alloc]initWithFrame:ivFrame];
        UIImage*image=[UIImage imageNamed:imgstr];
        iv.image=image;
        self.iv=iv;

        [self addSubview:iv];
    }
    return self;
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    UILabel*alab=self.lab;
    LabelStyle*ls=self.lss[selected?1:0];
    alab.font=ls.font;
    alab.textColor=ls.textColor;
    int index=selected?1:0;
    alab.text=self.titles[index];
    NSString*imgstr=self.ivStrs[index];
    if (![imgstr containsString:@"http"]) {
        UIImage*img=[UIImage imageNamed:imgstr];
        if (self.tintcolors.count>index) {
            UIColor*color=self.tintcolors[index];
            img=[img imageWithColor:color];
        }
        self.iv.image=img;
    }
    else
        {
        [self.iv sd_setImageWithURL:[NSURL URLWithString:imgstr]];
        }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
