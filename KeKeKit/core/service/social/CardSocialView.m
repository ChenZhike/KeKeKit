//
//  CardSocialView.m
//  ZiLuoLan
//
//  Created by CZK on 2020/4/10.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import "CardSocialView.h"

@implementation CardSocialView
- (instancetype)initWithWords:(NSArray*)words
{
    self = [super init];
    if (self) {

        NSArray*imgs=@[@"收藏未选中",@"消息",@"分享",@"举报",@"打赏"];
        BOOL is_final_right=YES;
        CGFloat out_margin=24.5f;

        CGFloat edge_margin=9.5f;
        CGFloat inner_space_w=4*WINDOWW/375;
        CGFloat btn_space=13.5*WINDOWW/375;
        CGFloat btnH=20;
        CGFloat nowx=edge_margin;
        CGFloat suggestW=WINDOWW-out_margin*2;
        int btns_count=imgs.count;
        self.frame=RECT(out_margin, 0, suggestW, btnH);

        NSMutableArray*btns=[[NSMutableArray alloc]init];
        self.btns=btns;
        for (int i=0; i<btns_count; i++) {

            UIButton*btn=[[UIButton alloc]init];
            UIImageView*iv;
            NSString*imgstr=imgs[i];
            UIImage*image=[UIImage imageNamed:imgstr];

            CGFloat img_w=image.size.width/image.scale;
            CGFloat img_h=image.size.height/image.scale;
            CGFloat img_y=(btnH-img_h)/2;
            iv=[[UIImageView alloc]initWithFrame:RECT(0, img_y, img_w, img_h)];
            iv.image=image;
            iv.tag=1;
            UILabel*alab;
            UIView*fatherView=nil;
            CGFloat lab_w=[words[i] sizeWithAttributes:[GlobalAttributeDic social_attriDic]].width;
            alab=[[UILabel alloc]initWithFrame:CGRectMake(iv.right+inner_space_w, (btnH-9)/2, lab_w, 9)];
            [alab setSocialAttributeWords:words[i]];

            if (is_final_right&&(i==btns_count-1)) {
                nowx=suggestW-edge_margin-btn.width;
            }
            btn.frame=RECT(nowx, 0, alab.right, btnH);
            [btn addSubview:iv];
            [btn addSubview:alab];
            [fatherView addSubview:alab];

             [self addSubview:btn];
            btn.tag=i;
            [btns addObject:btn];


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
