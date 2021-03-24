//
//  ELLayout.h
//  Elliriky
//
//  Created by CZK on 2020/7/14.
//  Copyright © 2020 weike. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark-新的布局定义
struct ELHang {
    int totalCount;
    int perLineCount;
};
typedef struct CG_BOXABLE ELHang ELHang;
ELHang ELHangMake(int totalCount,
int perLineCount);
//根据屏幕最大宽度，左右间距，控件水平内间距，及是否适配，确定x轴
struct ELLayoutX {
    CGFloat maxW;
    CGFloat xMargin;
    CGFloat rightMargin;
    CGFloat sons_inner_x;
    BOOL xMargin_shipei;
    BOOL rightMargin_shipei;
    BOOL sons_inner_x_shipei;
};
typedef struct CG_BOXABLE ELLayoutX ELLayoutX;
ELLayoutX ELLayoutXMake(CGFloat maxW,
CGFloat xMargin,
CGFloat rightMargin,
CGFloat sons_inner_x,
BOOL xMargin_shipei,
BOOL rightMargin_shipei,
BOOL sons_inner_x_shipei);
//根据屏幕上下间距，控件垂直内间距，及是否适配，确定y轴
struct ELLayoutY {
    CGFloat yMargin;
    CGFloat bottomMargin;
    CGFloat sons_inner_y;
    CGFloat son_h;
    BOOL yMargin_shipei;
    BOOL bottomMargin_shipei;
    BOOL sons_inner_y_shipei;
    BOOL son_h_shipei;
};
typedef struct CG_BOXABLE ELLayoutY ELLayoutY;
ELLayoutY ELLayoutYMake(CGFloat yMargin,
CGFloat bottomMargin,
CGFloat sons_inner_y,
CGFloat son_h,
BOOL yMargin_shipei,
BOOL bottomMargin_shipei,
BOOL sons_inner_y_shipei,
BOOL son_h_shipei);
#pragma mark-快速设置
ELLayoutX LRLayoutXMake(CGFloat maxW,
CGFloat xMargin,
CGFloat sons_inner_x,
BOOL xMargin_shipei,
                        BOOL sons_inner_x_shipei);

ELLayoutY YBLayoutYMake(CGFloat yMargin,
CGFloat sons_inner_y,
CGFloat son_h,
BOOL yMargin_shipei,
BOOL sons_inner_y_shipei,
                        BOOL son_h_shipei);
@interface ELLayout : NSObject

@end

NS_ASSUME_NONNULL_END
