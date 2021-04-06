//
//  UIView+SonSuperView.m
//  TestWorkSpace
//
//  Created by KeKe on 15/8/18.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "UIView+SonSuperView.h"

@implementation UIView (SonSuperView)
-(void)removeSubviews
{
    NSArray*sons=self.subviews;
    for (UIView*avie in sons) {
        [avie removeFromSuperview];
    }
}
-(UIView*)subViewWithTag:(NSInteger)tag
{
    for (UIView*sonvie in self.subviews) {
        if (sonvie.tag==tag) {
            return sonvie;
        }
    }
    return nil;
}
-(UIView*)sonViewWithTag:(NSInteger)tag
{
    UIView*resultVie=nil;
    for (UIView*sonvie in self.subviews) {
        if (tag==sonvie.tag) {
            return sonvie;
        }
        else
        {
            resultVie=[sonvie sonViewWithTag:tag];
        }
    }
    return resultVie;
}
-(UITableViewCell*)getCell
{
    UITableViewCell*cell=nil;
    UIView*nowVie=self;
    while (cell==nil) {
        UIView*superVie=nowVie.superview;
        if ([nowVie.superview isKindOfClass:[UITableViewCell class]]) {
            cell=(UITableViewCell*)superVie;
        }
        else
        {
            nowVie=superVie;
        }
    }
    
    return cell;
}
-(UICollectionViewCell*)getCollctionCell
{
    UITableViewCell*cell=nil;
    UIView*nowVie=self;
    while (cell==nil) {
        UIView*superVie=nowVie.superview;
        if ([nowVie.superview isKindOfClass:[UICollectionViewCell class]]) {
            cell=(UICollectionViewCell*)superVie;
        }
        else
            {
            nowVie=superVie;
            }
    }

    return cell;
}
-(UIImageView*)addIVWithImgStr:(NSString*)imgstr frame:(CGRect)frame
{
    UIImage*image=[UIImage imageNamed:imgstr];
    UIImageView*iv=[[UIImageView alloc]initWithFrame:frame];

    iv.image=image;

    [self addSubview:iv];
    return iv;
}
- (void)zhiding
{
    [self.superview bringSubviewToFront:self];
}
-(void)underFahter:(UIView*)father
{
    [self removeFromSuperview];
    [father addSubview:self];
}
@end
