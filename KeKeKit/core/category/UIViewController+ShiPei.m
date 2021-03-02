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
@end
