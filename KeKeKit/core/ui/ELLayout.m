//
//  ELLayout.m
//  Elliriky
//
//  Created by CZK on 2020/7/14.
//  Copyright © 2020 weike. All rights reserved.
//

#import "ELLayout.h"
#pragma mark-新的布局定义
ELHang ELHangMake(int totalCount,
int perLineCount)
{
    ELHang hang;
    hang.totalCount=totalCount;
    hang.perLineCount=perLineCount;
    return hang;
}

ELLayoutX ELLayoutXMake(CGFloat maxW,//整体的最大宽度
CGFloat xMargin,
CGFloat rightMargin,
CGFloat sons_inner_x,
BOOL xMargin_shipei,
BOOL rightMargin_shipei,
BOOL sons_inner_x_shipei)
{
    ELLayoutX eLLayoutX;
    eLLayoutX.maxW=maxW;
    eLLayoutX.xMargin=xMargin;
    eLLayoutX.rightMargin=rightMargin;
    eLLayoutX.sons_inner_x=sons_inner_x;

    eLLayoutX.xMargin_shipei=xMargin_shipei;
    eLLayoutX.rightMargin_shipei=rightMargin_shipei;
    eLLayoutX.sons_inner_x_shipei=sons_inner_x_shipei;
    return eLLayoutX;
}

ELLayoutY ELLayoutYMake(CGFloat yMargin,
CGFloat bottomMargin,
CGFloat sons_inner_y,
CGFloat son_h,
BOOL yMargin_shipei,
BOOL bottomMargin_shipei,
BOOL sons_inner_y_shipei,
BOOL son_h_shipei)
{
    ELLayoutY eLLayoutY;
    eLLayoutY.yMargin=yMargin;
    eLLayoutY.bottomMargin=bottomMargin;
    eLLayoutY.sons_inner_y=sons_inner_y;
    eLLayoutY.son_h=son_h;
    eLLayoutY.yMargin_shipei=yMargin_shipei;
    eLLayoutY.bottomMargin_shipei=bottomMargin_shipei;
    eLLayoutY.sons_inner_y_shipei=sons_inner_y_shipei;
    eLLayoutY.son_h_shipei=son_h_shipei;
    return eLLayoutY;
}
#pragma mark-快速设置
ELLayoutX LRLayoutXMake(CGFloat maxW,
CGFloat xMargin,
CGFloat sons_inner_x,
BOOL xMargin_shipei,
BOOL sons_inner_x_shipei)
{
    ELLayoutX eLLayoutX;
    eLLayoutX.maxW=maxW;
    eLLayoutX.xMargin=xMargin;
    eLLayoutX.rightMargin=xMargin;
    eLLayoutX.sons_inner_x=sons_inner_x;

    eLLayoutX.xMargin_shipei=xMargin_shipei;
    eLLayoutX.rightMargin_shipei=xMargin_shipei;
    eLLayoutX.sons_inner_x_shipei=sons_inner_x_shipei;
    return eLLayoutX;
}
ELLayoutY YBLayoutYMake(CGFloat yMargin,
CGFloat sons_inner_y,
CGFloat son_h,
BOOL yMargin_shipei,
BOOL sons_inner_y_shipei,
BOOL son_h_shipei)
{
    ELLayoutY eLLayoutY;
    eLLayoutY.yMargin=yMargin;
    eLLayoutY.bottomMargin=yMargin;
    eLLayoutY.sons_inner_y=sons_inner_y;
    eLLayoutY.son_h=son_h;
    eLLayoutY.yMargin_shipei=yMargin_shipei;
    eLLayoutY.bottomMargin_shipei=yMargin_shipei;
    eLLayoutY.sons_inner_y_shipei=sons_inner_y_shipei;
    eLLayoutY.son_h_shipei=son_h_shipei;
    return eLLayoutY;
}
@implementation ELLayout


@end
