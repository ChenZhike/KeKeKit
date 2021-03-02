//
//  UIViewController+ShiPei.m
//  Elliriky
//
//  Created by CZK on 2020/7/11.
//  Copyright © 2020 weike. All rights reserved.
//

#import "UIViewController+ShiPei.h"


@implementation UIViewController (ShiPei)
- (void)fullScreenWhenPresented
{
    if ([[UIDevice currentDevice].systemVersion intValue] >=13) {
        self.modalPresentationStyle=UIModalPresentationFullScreen;
    }
}
- (void)jieping:(UIView*)aview
{
    UIGraphicsBeginImageContext(aview.frame.size);//开始图片上下文
        [aview.layer renderInContext:UIGraphicsGetCurrentContext()];
        //把目标view的layer上的内容绘制到新建的图片上下文上面
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        //从图片上下文获得图片
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
@end
