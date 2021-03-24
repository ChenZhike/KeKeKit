//
//  ViewTool.m
//  ZiLuoLan
//
//  Created by CZK on 2020/4/22.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import "ViewTool.h"
#define ShiPeiWindowW (WINDOWW/375)
@implementation ViewTool

//水平线性布局：固定整体高度，固定控件WHY，固定内间距，最左边控件的x=最右边控件的rightMargin
//view代码工具：
//确定父view及其宽高，子view个数。
//子view区最上最下最左最右坐标，是否根据屏幕缩放。
//子view间的水平间距，是否根据屏幕缩放。
+(NSArray*)horizontal_sonviewsWithFatherView:(UIView*)father_view son_count:(int)son_count margins:(NSArray*)margins allScreenscale:(BOOL)allScreenscale
{
    NSMutableArray*scales=[[NSMutableArray alloc]init];
    id obj=allScreenscale?@(1):@(0);
    for (int i=0; i<son_count; i++) {
        [scales addObject:obj];
    }
    return [self horizontal_sonviewsWithFatherView:father_view son_count:son_count margins:margins is_screenscales:scales];
}
+(NSArray*)horizontal_sonviewsWithFatherView:(UIView*)father_view son_count:(int)son_count margins:(NSArray*)margins is_screenscales:(NSArray*)is_screenscales
{
    NSMutableArray*values=[[NSMutableArray alloc]init];
    for (int i=0; i<margins.count; i++) {
        BOOL isshipei=[is_screenscales[i] boolValue];
        CGFloat value=[margins[i] floatValue]*(isshipei?ShiPeiWindowW:1);
        [values addObject:@(value)];
    }
    CGFloat top=[values[0]floatValue];
    CGFloat left=[values[1]floatValue];
    CGFloat bottom=[values[2]floatValue];
    CGFloat right=[values[3]floatValue];
    CGFloat space=[values[4]floatValue];
    CGFloat view_w=(father_view.width-right-left-space*(son_count-1))/son_count;
    CGFloat view_h=father_view.height-bottom-top;
    NSMutableArray*result=[[NSMutableArray alloc]init];
    for (int i=0; i<son_count; i++) {
        UIView*aview=[[UIView alloc]init];
        aview.frame=RECT(left+i*(view_w+space), top, view_w, view_h);
        [father_view addSubview:aview];
        [result addObject:aview];
    }
    return result;
}
+(CGFloat)getCellH:(CGSize)cover_origin_size extra_const_h:(CGFloat)extra_const_h
              nowW:(CGFloat)nowW
{
  CGFloat result_h=  nowW/cover_origin_size.width*cover_origin_size.height+extra_const_h;
    return result_h;
}
//

    /// //输入：总数，每行最大数，实际数，
    //屏幕左右间距，控件内间距，及是否适配
    //根据总数，每行最大数，实际数，得出行数
    //根据屏幕最大宽度，左右间距，控件水平内间距，及是否适配，确定x轴
    //根据屏幕上下间距，控件垂直内间距，及是否适配，确定y轴
    //根据行数，y轴计算整体高度，创建父view并设置frame。
    //根据控件类别字符串，创建控件对象，设置frame，添加到父view上
    //返回父view。
    /// @param hang ELHang
    /// @param elx ELLayoutX
    /// @param ely ELLayoutY
+(UIView*)workViewWithHang:(ELHang)hang elx:(ELLayoutX)elx ely:(ELLayoutY)ely sonClass:(Class)class
{
    UIView*fatherView=[[UIView alloc]init];

    fatherView.backgroundColor=[UIColor whiteColor];

    //根据总数，每行最大数，实际数，得出行数
    int perLineCount=hang.perLineCount;
    int row=[@(hang.totalCount) zhengchuplus:perLineCount];

    //根据屏幕最大宽度，左右间距，控件水平内间距，及是否适配，确定x轴

    //根据屏幕上下间距，控件垂直内间距，及是否适配，确定y轴

    CGFloat yMargin=[@(ely.yMargin) shipeiValue:ely.yMargin_shipei];
    CGFloat bottomMargin=[@(ely.bottomMargin) shipeiValue:ely.bottomMargin_shipei];
    CGFloat sons_inner_y=[@(ely.sons_inner_y) shipeiValue:ely.sons_inner_y_shipei];
    CGFloat totalH=yMargin+bottomMargin+sons_inner_y*(row-1)+ely.son_h*row;
        //根据行数，y轴计算整体高度，创建父view并设置frame。
    fatherView.frame=RECT(0, 0, elx.maxW,totalH );

    //根据控件类别字符串，创建控件对象，设置frame，添加到父view上
    CGFloat xMargin=[@(elx.xMargin) shipeiValue:elx.xMargin_shipei];
    CGFloat rightMargin=[@(elx.rightMargin) shipeiValue:elx.rightMargin_shipei];
    CGFloat sons_inner_x=[@(elx.sons_inner_x) shipeiValue:elx.sons_inner_x_shipei];
    CGFloat w=(elx.maxW-xMargin-rightMargin)/perLineCount;
    CGFloat son_h=[@(ely.son_h) shipeiValue:ely.son_h_shipei];
    for (int i=0; i<row; i++) {
        for (int j=0; j<MIN(perLineCount, hang.totalCount-i*perLineCount); j++) {
            CGRect rect=CGRectMake(xMargin+j*(sons_inner_x+w), yMargin+i*(sons_inner_y+son_h), w, son_h);
            UIView*vie=(UIView*)[[class alloc]init];
            vie.tag=i*perLineCount+j;
            vie.frame=rect;
            [fatherView addSubview:vie];
        }

    }
    //返回父view。
    return fatherView;
}
@end
