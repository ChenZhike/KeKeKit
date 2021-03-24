//
//  ViewTool.h
//  ZiLuoLan
//
//  Created by CZK on 2020/4/22.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewTool : NSObject
+(NSArray*)horizontal_sonviewsWithFatherView:(UIView*)father_view son_count:(int)son_count margins:(NSArray*)margins is_screenscales:(NSArray*)is_screenscales;
+(NSArray*)horizontal_sonviewsWithFatherView:(UIView*)father_view son_count:(int)son_count margins:(NSArray*)margins allScreenscale:(BOOL)allScreenscale;
+(CGFloat)getCellH:(CGSize)cover_origin_size extra_const_h:(CGFloat)extra_const_h
              nowW:(CGFloat)nowW;

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
+(UIView*)workViewWithHang:(ELHang)hang elx:(ELLayoutX)elx ely:(ELLayoutY)ely sonClass:(Class)aclass;
@end

NS_ASSUME_NONNULL_END
