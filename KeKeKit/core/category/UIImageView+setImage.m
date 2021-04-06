//
//  UIImageView+setImage.m
//  KeKeKit
//
//  Created by KeKe on 3018/9/23.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import "UIImageView+setImage.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (setImage)
-(void)setWithImgstr:(NSString*)imgstr
{
    if ([imgstr containsString:@"http"]) {
        [self sd_setImageWithURL:[NSURL URLWithString:imgstr]];
    }
    else
        {
        [self setImage:[UIImage imageNamed:imgstr]];
        }
}
-(void)autoSetXuanZhongImg:(NSString*)imgstr
{
    if ([imgstr containsString:@"未选中"]) {
       NSString*sel_imgsgr=[imgstr stringByReplacingOccurrencesOfString:@"未" withString:@""];
       self.highlightedImage=[UIImage imageNamed:sel_imgsgr];
           }
}
-(void)setVideoCoverWithImgstr:(NSString*)imgstr
{
    if ([imgstr containsString:@"http"]) {
        if ([[imgstr lowercaseString] containsString:@".gif"]) {
//            self an
        }
        [self sd_setImageWithURL:[NSURL URLWithString:imgstr] placeholderImage:[UIImage imageNamed:@"video_cover"]];
    }
    else
        {
        [self setImage:[UIImage imageNamed:imgstr]];
        }
}
-(void)setPortraitWithImgstr:(NSString*)imgstr
{
    if ([imgstr containsString:@"http"]) {
        [self sd_setImageWithURL:[NSURL URLWithString:imgstr] placeholderImage:[UIImage imageNamed:@"ic_head_s"]];
    }
    else if(imgstr.length)
        {
        [self setImage:[UIImage imageNamed:imgstr]];
        }
    else
        {
         [self setImage:[UIImage imageNamed:@"ic_head_s"]];
        }
}
-(void)setTuiguangLevelImg:(int)levelNum
{
    NSArray*imgs=[NSArray arrayWithObjects:@"推广-入门",@"推广-进阶",@"推广-达人",@"推广-专家",@"推广-教授", nil];
    if (levelNum<imgs.count) {
        NSString*imgstr=imgs[levelNum];
        [self setImage: [UIImage imageNamed:imgstr]];
    }
    else
        {
        [self setImage:nil];
        }

}
-(void)clipCommonMode
{
    self.contentMode=UIViewContentModeScaleAspectFill;
    self.clipsToBounds=YES;
}
@end
