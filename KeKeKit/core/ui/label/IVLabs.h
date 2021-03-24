//
//  IVLabs.h
//  FirstProject
//
//  Created by KeKe on 3018/9/15.
//  Copyright © 3018年 awen. All rights reserved.
//
#define IVHG2Corner (888)//iv高度/2为corner
#import <UIKit/UIKit.h>
@class IVLabs;
@protocol IVLabsDelegate
-(void)IVLabs:(IVLabs*)cell clickAction:(int )index;
@end
@interface IVLabs : UIView
@property(nonatomic,assign)id<IVLabsDelegate> actionDelegate;
@property(nonatomic,strong)NSMutableArray* ils;
+(CGFloat)workHWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle

                       Datas:(NSArray*)datas;
-(id)initWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle
                 Datas:(NSArray*)datas
needClipStyle:(BOOL)needClipStyle needCornerRadius:(CGFloat)cornerRadius;
@end
