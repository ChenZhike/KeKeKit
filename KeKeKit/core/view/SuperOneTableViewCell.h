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
@property(nonatomic,assign)CGFloat nowH;
+(CGFloat)suggestedHWithData:(NSObject*)obj;
-(void)configWithData:(NSObject*)obj;
@property(nonatomic,strong,nullable)NSDictionary* constdic;
- (UILabel*)addLinesLabWithorigin:(CGPoint)origin right_edge:(CGFloat)right_edge text:(NSString*)text  attribute:(NSDictionary*)attribute;

- (void)addAttriLabWithframe:(CGRect)frame text:(NSString*)text  perh:(CGFloat)perh;
- (UILabel*)addSimpleLab:(CGRect)frame text:(NSString*)text ls:(LabelStyle*)ls;
- (UILabel*)addTitleVieWithY:(CGFloat)nowY title:(NSString*)title ls:(LabelStyle*)ls h:(CGFloat)h;
-(void)addWhiteBackTopCorner;
- (void)addTopPicAndCornerStyle;
-(void)shadowStyleWithBackView:(UIView*)backview;
-(void)quickCellBtnClick:(UIButton*)sender;
- (void)quickCellTapClick:(UITapGestureRecognizer*)tapgr;
#pragma mark-业务数据设置
- (void)setTypeAndPlayNumWithLab:(UILabel*)lab;

@end
