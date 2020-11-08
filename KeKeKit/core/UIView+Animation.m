//
//  UIView+Animation.m
//  JinZi
//
//  Created by KeKe on 16/4/22.
//  Copyright © 2016年 丫丫科技. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
-(void)startShake
{
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform"];
    shake.duration = 0.13;
    shake.autoreverses = YES;
    shake.repeatCount = MAXFLOAT;
    shake.removedOnCompletion = NO;
//    CGFloat rotation = 0.03;
    CGFloat rotation = 0.5;
    shake.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform,-rotation, 0.0 ,0.0 ,1.0)];
    shake.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, rotation, 0.0 ,0.0 ,1.0)];
    
    [self.layer addAnimation:shake forKey:@"shakeAnimation"];
}
-(void)stopShake
{
    [self.layer removeAnimationForKey:@"shakeAnimation"];
}
@end
