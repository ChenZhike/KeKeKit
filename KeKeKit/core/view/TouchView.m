//
//  TouchView.m
//  Movie
//
//  Created by CZK on 2019/7/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.contentView) {
        UITouch*touch=[touches anyObject];
        CGPoint point= [touch locationInView:self];
        CGRect content_rect=self.contentView.frame;
        if (!CGRectContainsPoint(content_rect, point)) {
             [self removeFromSuperview];
        }
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
