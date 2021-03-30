//
//  IVLabel.h
//  KeKeKit
//
//  Created by KeKe on 3018/9/15.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IVLabModel;
struct ILWLayout
{
    CGFloat maxW;//最大宽度
    int perLineDataNum;//每行最大数量
    CGFloat leftMarginW;//左侧屏幕间距
    CGFloat innerspaceMarginW;//ivlabel间间距宽
    CGFloat rightMarginW;//右侧屏幕间距
};
typedef struct ILWLayout ILWLayout;
struct ILHLayout
{
    CGFloat ivtopMargin;
    CGFloat ivPofHW;//图片的高度/宽度
    CGFloat innerspaceMarginH;//图文上下间距H
    CGFloat lBottomMargin;//文字到il底部的间距
};
typedef struct ILHLayout ILHLayout;
@interface IVLabel : UIButton
@property(nonatomic,strong)UIImageView* iv;
@property(nonatomic,strong)UILabel* l;

-(void)fillSubViewsWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle
                              Datas:(IVLabModel*)data;
//-(void)fillSubViewsWithTotalMaxWidth:(CGFloat)maxW perLineDataNum:(int)perLineDataNum MarginW:(CGFloat)MarginW IVTopMargin:(CGFloat)ivtopMargin  innerspaceMarginW:(CGFloat)innerspaceMarginW innerspaceMarginH:(CGFloat)innerspaceMarginH ivPofHW:(CGFloat)ivPofHW
//                             labFont:(UIFont*)font labColor:(UIColor*)textcolor textAlignment:(NSTextAlignment)textAlignment Datas:(IVLabModel*)data;
@end
