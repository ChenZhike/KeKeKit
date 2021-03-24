//
//  UIView+Image.m
//  KeKeKit
//
//  Created by 陈志科 on 2021/3/24.
//

#import "UIView+Image.h"

@implementation UIView (Image)
-(UIImage*)convertToImage{
    UIView*v=self;
    CGSize s = v.bounds.size;
        // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需  要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, YES, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
