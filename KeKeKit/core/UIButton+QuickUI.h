    //
    //  UIButton+QuickUI.h
    //  FirstProject
    //
    //  Created by KeKe on 2019/2/13.
    //  Copyright © 2019 cmd. All rights reserved.
    //

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (QuickUI)
+(UIButton*)getAppCommonBackBtn;
+(UIButton*)getAppCommonWhiteBackBtn;
-(void)onceSelected:(BOOL)selected;
-(void)setWithImgstr:(NSString*)imgstr;
+(UIButton*)tijiaoBWithTitle:(NSString*)tile target:(id)target sel:(SEL)sel;//获取提交按钮，请自定义xy坐标
+(UIButton*)getContentAddBtn;
-(void)cleanImgAndSetTitle:(NSString*)title;
-(void)whiteBackTextStyle;
-(void)BlackBackTextStyle;
-(void)noSelectTextStyle;
@end

NS_ASSUME_NONNULL_END
