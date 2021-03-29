//
//  SVProgressHUD+DIY.h
//  ZiLuoLan
//
//  Created by 陈志科 on 2021/3/29.
//  Copyright © 2021 lingxin. All rights reserved.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (DIY)
@property (nonatomic, strong) UIControl *overlayView;
+ (SVProgressHUD*)sharedView;
@end

NS_ASSUME_NONNULL_END
