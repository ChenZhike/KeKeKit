//
//  QRCodeTool.m
//  FirstProject
//
//  Created by KeKe on 3018/10/6.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "QRCodeTool.h"

@implementation QRCodeTool
-(UIImage*)createWithSize:(CGFloat)width url:(NSString*)url
{
        //创建过滤器
 CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    //过滤器恢复默认
    [filter setDefaults];

  //给过滤器添加数据
   NSString *string = url;

   //将NSString格式转化成NSData格式
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];

    [filter setValue:data forKeyPath:@"inputMessage"];

     //获取二维码过滤器生成的二维码
    CIImage *image = [filter outputImage];

    UIImage*resultImage=[self createNonInterpolatedUIImageFormCIImage:image withSize:width];
    return resultImage;
}
/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));

        // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);

        // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
@end
