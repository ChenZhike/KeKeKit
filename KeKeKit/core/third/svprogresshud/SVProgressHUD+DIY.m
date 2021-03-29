//
//  SVProgressHUD+DIY.m
//  ZiLuoLan
//
//  Created by 陈志科 on 2021/3/29.
//  Copyright © 2021 lingxin. All rights reserved.
//

#import "SVProgressHUD+DIY.h"

@implementation SVProgressHUD (DIY)
+ (SVProgressHUD*)sharedView {
    static dispatch_once_t once;
    static SVProgressHUD *sharedView;

    dispatch_once(&once, ^ { sharedView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UIColor*blackcolor= [[UIColor blackColor] colorWithAlphaComponent:0.32];
        sharedView.backgroundColor=blackcolor;
    });
    return sharedView;
}
@end
