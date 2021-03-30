//
//  UIImageView+setImage.h
//  KeKeKit
//
//  Created by KeKe on 3018/9/23.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (setImage)
-(void)setWithImgstr:(NSString*)imgstr;
-(void)setVideoCoverWithImgstr:(NSString*)imgstr;
-(void)setPortraitWithImgstr:(NSString*)imgstr;
-(void)setTuiguangLevelImg:(int)levelNum;
-(void)autoSetXuanZhongImg:(NSString*)imgstr;
@end
