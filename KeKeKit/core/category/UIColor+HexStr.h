//
//  UIColor+HexStr.h
// KeKeKit
//
//  Created by KeKe on 15/8/6.
//  Copyright (c) 2015年 KeKeKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexStr)
-(NSString*)hexStr;
+ (UIColor *)colorWithHex:(NSString *)hexString;
@end
