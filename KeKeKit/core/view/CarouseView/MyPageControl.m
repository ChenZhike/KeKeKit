//
//  MyPageControl.m
//  CZKFrameWork
//
//  Created by CZK on 2018/12/15.
//  Copyright © 2018 czk. All rights reserved.
//

#import "MyPageControl.h"

@implementation MyPageControl
    //重写setCurrentPage方法，可设置圆点大小
- (void) setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];

    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 5;
        size.width = 5;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     size.width,size.height)];
        subview.layer.cornerRadius=subview.height/2;
        subview.clipsToBounds=YES;

//        [subview borderColr:HexColor(@"979797") width:0.5f];
    }
}
@end
