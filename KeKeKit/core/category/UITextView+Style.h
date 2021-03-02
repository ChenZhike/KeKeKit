//
//  UITextView+Style.h
//  ZiLuoLan
//
//  Created by CZK on 2020/5/27.
//  Copyright © 2020 lingxin. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Style)
-(void)setPlaceStr:(NSString*)placeStr;
-(void)placeStyle;
-(void)normalStyle;
-(void)setNormalTextColor:(UIColor*)normalTextColor;
-(BOOL)isPlaceStyle;
-(BOOL)checkEmpty;
@end

NS_ASSUME_NONNULL_END
