//
//  CustomNavigationController.h
//  KeKeKit
//
//  Created by KeKe on 3018/10/5.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationController : UINavigationController
@property(nonatomic,strong,nullable)UIPanGestureRecognizer* fullScreenGes;
-(UIImage*)getNaviBarBackImg;

@end
