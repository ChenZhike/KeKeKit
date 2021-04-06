//
//  UIView+SonSuperView.h
//  TestWorkSpace
//
//  Created by KeKe on 15/8/18.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITableViewCell;
@interface UIView (SonSuperView)
-(void)removeSubviews;
-(UIView*)subViewWithTag:(NSInteger)tag;
-(UIView*)sonViewWithTag:(NSInteger)tag;
-(UITableViewCell*)getCell;
-(UICollectionViewCell*)getCollctionCell;
-(UIImageView*)addIVWithImgStr:(NSString*)imgstr frame:(CGRect)frame;
- (void)zhiding;
-(void)underFahter:(UIView*)father;
@end
