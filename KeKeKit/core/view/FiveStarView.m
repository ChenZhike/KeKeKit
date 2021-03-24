//
//  FiveStarView.m
//  FirstProject
//
//  Created by CZK on 2019/9/24.
//  Copyright © 2019 czk. All rights reserved.
//

#import "FiveStarView.h"

@implementation FiveStarView
-(NSArray*)ivnames
{
    return self.whiteOrBlackBack?[self white_ivnames]:[self black_ivnames];
}
-(NSArray*)white_ivnames
{
    return @[@"white_xing",@"yellow_xing"];
}
-(NSArray*)black_ivnames
{
    return @[@"teacher_xing2",@"teacher_xing"];
}
-(id)initWithImgW:(CGFloat)imgw imgh:(CGFloat)imgh space:(CGFloat)space whiteOrBlackBack:(BOOL)whiteOrBlackBack
{
    if (self=[super init]) {
        int starcount=5;
        CGFloat w=imgw*starcount+space*(starcount-1);
        self.frame=RECT(0, 0, w, imgh);
        self.whiteOrBlackBack=whiteOrBlackBack;
        if (self.stars==nil) {
            self.stars=[[NSMutableArray alloc]init];
            CGFloat ivx=0;
            CGFloat ivy=0;

            CGFloat ivspace=space;
            for (int i=0; i<starcount; i++) {
                NSString*imgstr=[self ivnames][0];
                UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(ivx+(imgw+ivspace)*i, ivy, imgw, imgh)];
                UIImage*image=[UIImage imageNamed:imgstr];
                iv.image=image;
                [self addSubview:iv];
                [self.stars addObject:iv];
            }
        }
    }
    return self;
}
-(void)fillStarWithCount:(int)count
{
    for (int i=0; i<self.stars.count; i++) {
        UIImageView*iv=self.stars[i];
        if (i<count) {
            iv.image=[UIImage imageNamed:[self ivnames][1]];;
        }
        else
            {
            iv.image=[UIImage imageNamed:[self ivnames][0]];;
            }
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
