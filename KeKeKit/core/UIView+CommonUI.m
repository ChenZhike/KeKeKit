//
//  UIView+CommonUI.m
//  JinZi
//
//  Created by KeKe on 15/12/24.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import "UIView+CommonUI.h"
#define CommonUIBottomVieH 44
@implementation UIView (CommonUI)
+(UIView*)getABotVieWithTitlesArr:(NSArray*)titlesArr block:(void (^)(UIButton* obj, NSUInteger idx))block
{
    UIView*resultVie=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, CommonUIBottomVieH)];
    float btnW=WINDOWW/titlesArr.count;
    for (int i=0;i<titlesArr.count;i++) {
        NSString*titleStr=[titlesArr objectAtIndex:i];
        UIButton*abtn=[[UIButton alloc]initWithFrame:RECT(btnW*i, 0, btnW, CommonUIBottomVieH)];
        [abtn setTitle:titleStr forState:UIControlStateNormal];
        [abtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //        [abtn setBackgroundColor:backColor];
        abtn.tag=i;
        [abtn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
            block(abtn,abtn.tag);
        }];
        [resultVie addSubview:abtn];
    }
    return resultVie;
}
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
@end
