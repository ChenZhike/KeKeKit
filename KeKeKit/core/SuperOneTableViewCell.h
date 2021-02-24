    //
    //  SuperOneTableViewCell.h
    //  FirstProject
    //
    //  Created by KeKe on 3018/9/14.
    //  Copyright © 3018年 awen. All rights reserved.
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
