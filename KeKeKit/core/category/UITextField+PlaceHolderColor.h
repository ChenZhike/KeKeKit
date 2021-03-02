//
//  UITextField+PlaceHolderColor.h
// KeKeKit
//
//  Created by KeKe on 15/8/10.
//  Copyright (c) 2015年 KeKeKit. All rights reserved.
//
@class LabelStyle;
#import <UIKit/UIKit.h>
@interface UITextField (PlaceHolderColor)
-(void)simplePlaceColorWithStr:(NSString*)str color:(UIColor*)placeColor;
-(void)fillLS:(LabelStyle*)ls;
-(UIView*)addXiaLaRightView;
-(UIView*)addSmallRightImg:(NSString*)imgstr;
-(BOOL)isPlaceStyle;
-(BOOL)checkEmpty;
@end
