//
//  UIImage+Color.h
//  KeKeKit
//
//  Created by KeKe on 16/2/24.
//  Copyright © 2016年 KeKeKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
//改变图片颜色
- (UIImage *)imageWithColor:(UIColor *)color;
-(UIImage*)scaledToSize:(CGSize)newSize;
-(NSString*)saveToDisk;
-(UIImage *) imageWithTintColor:(UIColor * )tintColor;
-(UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;


// 控件绘制成图片
+ (UIImage *)imageWithView:(UIView *)view;
@end
