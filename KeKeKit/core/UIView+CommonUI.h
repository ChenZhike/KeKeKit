//
//  UIView+CommonUI.h
//  JinZi
//
//  Created by KeKe on 15/12/24.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CommonUI)
+(UIView*)getABotVieWithTitlesArr:(NSArray*)titlesArr block:(void (^)(UIButton* obj, NSUInteger idx))block;
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;//画虚线方法
@end
