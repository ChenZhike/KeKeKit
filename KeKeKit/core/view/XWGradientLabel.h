//
//  XWGradientLabel.h
//  GradientLabel
//
//  Created by Mac on 2017/9/30.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWGradientLabel : UIView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, copy) NSArray<UIColor *> *colors;

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, assign) CGPoint endPoint;

@end
