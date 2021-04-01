//
//  UIView+Frame.m
//  KeKeKit
//
//  Created by keke on 14-2-25.
//  Copyright (c) 2014年 KeKeKit. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (BOOL)containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsSubViewOfClassType:(Class)class {
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:class]) {
            return YES;
        }
    }
    return NO;
}
#pragma mark-xy
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)ay
{
    CGRect frame = self.frame;
    frame.origin.y = ay;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
#pragma mark - Height
- (CGFloat)height {
    return self.bounds.size.height;
}

- (void)setHeight:(CGFloat) newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

#pragma mark - Width
- (CGFloat)width {
    return self.bounds.size.width;
}

- (void)setWidth:(CGFloat) newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

#pragma mark - CenterX
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

#pragma mark - CenterY
- (CGFloat)centerY {
    return self.center.y;
}


- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
#pragma mark-Center
-(CGPoint)center_son
{
    return CGPointMake(self.width/2, self.height/2);
}
#pragma mark - Right
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

#pragma mark - Bottom
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

#pragma mark - Origin
- (void)setOrigin:(CGPoint)origin{
    CGRect rc = self.frame;
    rc.origin = origin;
    self.frame = rc;
}

-(CGPoint)origin{
    return self.frame.origin;
}

#pragma mark - Top
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark - Left
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

#pragma mark - Size
- (void)setSize:(CGSize)sz{
    CGRect rc = self.frame;
    rc.size = sz;
    self.frame = rc;
}

- (CGSize)size{
    return self.frame.size;
}

-(void) sizeToFitSubviews{
    CGFloat width=0;
    CGFloat height=0;
    for (UIView *subView in self.subviews) {
        if (subView.right>width) {
            width = subView.right;
        }
        if (subView.bottom > height) {
            height = subView.bottom;
        }
    }
    self.width = width;
    self.height = height;
}
-(void)cyHalf:(UIView*)vie
{
    self.centerY=vie.height/2;
}
-(void)cxHalf:(UIView*)vie
{
self.centerX=vie.width/2;
}
- (void)updateW:(CGFloat)width h:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.width = width;
    frame.size.height = height;
    self.frame = frame;
}
@end
