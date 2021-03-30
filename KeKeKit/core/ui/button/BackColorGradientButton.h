//
//  BackColorGradientButton.h
//  KeKeKit
//
//  Created by CZK on 2019/12/26.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackColorGradientButton : UIButton
- (void)setBackgroundColors:(NSArray<UIColor *> *)backgroundColors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint forState:(UIControlState)state;

- (void)setBackgroundColors:(NSArray<UIColor *> *)backgroundColors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint cornerRadius:(CGFloat)cornerRadius forState:(UIControlState)state;
@end

NS_ASSUME_NONNULL_END
