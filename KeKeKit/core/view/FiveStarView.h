//
//  FiveStarView.h
//  FirstProject
//
//  Created by CZK on 2019/9/24.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FiveStarView : UIView
@property(nonatomic,strong)NSMutableArray* stars;
@property(nonatomic,assign)BOOL whiteOrBlackBack;
-(id)initWithImgW:(CGFloat)imgw imgh:(CGFloat)imgh space:(CGFloat)space whiteOrBlackBack:(BOOL)whiteOrBlackBack;
-(void)fillStarWithCount:(int)count;
@end

NS_ASSUME_NONNULL_END
