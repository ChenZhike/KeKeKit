//
//  UIView+Frame.h
//  KeKeKit
//
//  Created by keke on 14-2-25.
//  Copyright (c) 2014年 KeKeKit. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (Frame)
//@property (assign, nonatomic) CGFloat x;
//@property (assign, nonatomic) CGFloat y;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic) CGFloat left;
@property (nonatomic, getter = left, setter = setLeft:) CGFloat x;

@property (nonatomic) CGFloat top;
@property (nonatomic, getter = top, setter = setTop:) CGFloat y;


@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
-(CGPoint)center_son;
-(BOOL) containsSubView:(UIView *)subView;
-(BOOL) containsSubViewOfClassType:(Class)className;
-(void) sizeToFitSubviews;
-(void)cyHalf:(UIView*)vie;
-(void)cxHalf:(UIView*)vie;
- (void)updateW:(CGFloat)width h:(CGFloat)height;
@end
