//
//  UIColor+RGBValues.h
//  KeKeKit
//
//  Created by Christian Di Lorenzo on 1/24/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGBValues)

- (UIColor *)darkerColor;
- (UIColor *)lighterColor;
- (BOOL)isLighterColor;
- (BOOL)isClearColor;
- (BOOL) isEqualToColor:(UIColor*)colorA;
@end
