//
//  UIImageView+setImage.h
//  FirstProject
//
//  Created by KeKe on 3018/9/23.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (setImage)
-(void)setWithImgstr:(NSString*)imgstr;
-(void)setVideoCoverWithImgstr:(NSString*)imgstr;
-(void)setPortraitWithImgstr:(NSString*)imgstr;
-(void)setTuiguangLevelImg:(int)levelNum;
-(void)autoSetXuanZhongImg:(NSString*)imgstr;
@end
