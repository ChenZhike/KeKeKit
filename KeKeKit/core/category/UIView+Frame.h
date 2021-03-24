//
//  UIView+Frame.h
//  KeKeKit
//
//  Created by keke on 14-2-25.
//  Copyright (c) 2014年 KeKeKit. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (Frame)
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat width;

@property (nonatomic, getter = left, setter = setLeft:) CGFloat x;
@property (nonatomic) CGFloat left;

@property (nonatomic, getter = top, setter = setTop:) CGFloat y;
@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
-(CGPoint)center_son;

@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

-(BOOL) containsSubView:(UIView *)subView;
-(BOOL) containsSubViewOfClassType:(Class)className;
-(void) sizeToFitSubviews;
-(void)cyHalf:(UIView*)vie;
-(void)cxHalf:(UIView*)vie;
@end
