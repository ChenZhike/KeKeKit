//
//  UIImage+Color.m
//  KeKeKit
//
//  Created by KeKe on 16/2/24.
//  Copyright © 2016年 KeKeKit. All rights reserved.
//

#import "UIImage+Color.h"
//#import <CoreGraphics/CoreGraphics.h>
@implementation UIImage (Color)
//改变图片颜色
- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(NSString*)saveToDisk
{
    NSData *imageData;
    NSString *imageFormat;
    BOOL ispng=YES;
    if (UIImagePNGRepresentation(self) != nil) {
        imageFormat = @"Content-Type: image/png \r\n";
        imageData = UIImagePNGRepresentation(self);

    }else{
        ispng=NO;
        imageFormat = @"Content-Type: image/jpeg \r\n";
        imageData = UIImageJPEGRepresentation(self, 1.0);

    }
    NSString*filename=[NSString stringWithFormat:@"%@",getCurrentTime()];
    filename=[filename stringByAppendingString:ispng?@".png":@".jpeg"];
    NSString*filepath=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),filename];
    [imageData writeToFile:filepath atomically:YES];
    return filepath;
}
-(UIImage*)scaledToSize:(CGSize)newSize
{
        // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);

        // Tell the old image to draw in this new context, with the desired
        // new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];

        // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

        // End the context
    UIGraphicsEndImageContext();

        // Return the new image.
    return newImage;
}
-(UIImage *)imageWithTintColor:(UIColor *)tintColor{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

-(UIImage *)imageWithGradientTintColor:(UIColor *)tintColor{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

-(UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode{
    
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
    
}


// 控件绘制成图片
+ (UIImage *)imageWithView:(UIView *)view {
    
    
    //转化成image
//    UIGraphicsBeginImageContext(view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES,[UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}
@end
