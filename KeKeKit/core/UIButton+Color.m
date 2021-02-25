//
//  UIButton+Color.m
//  KeKeKit
//
//  Created by KeKe on 16/2/24.
//  Copyright © 2016年 momoda. All rights reserved.
//

#import "UIButton+Color.h"

@implementation UIButton (Color)
-(void)setTintColorWhoAffectedImage:(UIColor *)tintColor normalImg:(NSString*)normalImg selectedImg:(NSString*)selectedImg
{
    self.tintColor=tintColor;
    if (normalImg) {
        [self setImage:[[UIImage imageNamed:normalImg]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    }
    if (selectedImg) {
        [self setImage:[[UIImage imageNamed:selectedImg]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    }
}
@end
