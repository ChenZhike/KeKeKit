    //
    //  SuperOneTableViewCell.h
    //  KeKeKit
    //
    //  Created by KeKe on 2021/03/30.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import <UIKit/UIKit.h>
@class SuperOneTableViewCell;
@protocol SuperOneTableViewCellDelegate
-(void)SuperOneTableViewCell:(SuperOneTableViewCell*)cell clickAction:(int )index;
@end
@interface SuperOneTableViewCell : UITableViewCell
@property(nonatomic,assign)id<SuperOneTableViewCellDelegate> actionDelegate;
@property(nonatomic,strong,nullable)NSDictionary* data;
+(CGFloat)suggestedHWithData:(NSObject*)obj;
-(void)configWithData:(NSObject*)obj;
@property(nonatomic,strong,nullable)NSDictionary* constdic;
- (void)addAttriLabWithframe:(CGRect)frame text:(NSString*)text  perh:(CGFloat)perh;
- (UILabel*)addSimpleLab:(CGRect)frame text:(NSString*)text ls:(LabelStyle*)ls;
- (UILabel*)addTitleVieWithY:(CGFloat)nowY title:(NSString*)title ls:(LabelStyle*)ls h:(CGFloat)h;
-(void)addWhiteBackTopCorner;
- (void)addTopPicAndCornerStyle;
-(void)shadowStyleWithBackView:(UIView*)backview;
@end
