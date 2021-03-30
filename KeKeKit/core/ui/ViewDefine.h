//
//  ViewDefine.h
//  KeKeKit
//
//  Created by CZK on 2020/8/8.
//  Copyright © 2020 czk. All rights reserved.
//

#ifndef ViewDefine_h
#define ViewDefine_h
#define HexColor(A)  [UIColor colorWithHex:A]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define RGB(R,G,B,A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define ThreeColor HexColor(@"333333")
#define SixColor HexColor(@"666666")
#define CoveredBackColor [[UIColor blackColor]colorWithAlphaComponent:0.1]
#define LineColor HexColor(@"eeeeee")
#define BorderColor LineColor
#define PlaceColor HexColor(@"999999")

#define TagBackColor HexColor(@"f5f5f5")
#define NotBlackTextColor RGB(68,68,68,1)
#define BorderLightGrayColor RGB(243, 243, 243, 1)
#define APPThemeColor RGB(255,145,19,1)
#define APPRedColor HexColor(@"F24475")
#define APPRedOrangeColor RGB(252,114,37,1)
#define APPGreenColor RGB(128,215,64,1)
#define APPBlueColor RGB(45,201,211,1)
#define APPGrayColor RGB(155,155,155,1)
#define APPGoldRoseColor RGB(250,115,52,1)
#define GrayColor (HexColor(@"8d8d8d"))
#define WaterBlackColor WhiteColor
#define GoldBackColor HexColor(@"FCEEDB")
#define LightWhiteColor RGB(38, 38, 38, 1)
#define GrayBlackColor  [UIColor colorWithHex:@"252627"]
#define ViewBackAiRuiKeColor RGB(239,239,239,1)
#define HomePageCellTitleTextColor  [UIColor colorWithRed:179/255.0 green:53/255.0 blue:52/255.0 alpha:1.0]
#define HomePageCellYindaoTextColor  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]
#define HomePageCellDataTextColor  [UIColor colorWithRed:108/255.0 green:108/255.0 blue:108/255.0 alpha:1.0]

#define placeVar @"placeStr"
#define ViewBackColor [GlobalConst topviewBackColor]
//配色方案区
//自然清新如花
#define NatureColorNormalBack RGB(217,224,191,1)
#define NatureColorRed RGB(218,85,67,1)
#define NatureColorBlack RGB(63,62,20,1)
#define NatureColorDarkGreen RGB(134,211,191,1)
#define NatureColorLightGreen RGB(190,238,216,1)
#define NatureColorNearlyWhite RGB(242,242,234,1)


//Wonderful渐变
#import "SXColorGradientView.h"//渐变view
#import "SXColorLabel.h"//彩色label，<>内的文字彩色，[]内的加粗
#import "SXMarquee.h"//跑马灯
#import "SXHeadLine.h"//一行多条公告
#import "UIColor+Wonderful.h"//各个主体色下不错的颜色
#import "UILabel+Wonderful.h"//label快速设置彩色样式
#import "UIColor+Separate.h"//反置颜色，按百分比上调或下调彩色值

    //判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define TabHeight 54.0f
#define iPhoneX ([UIScreen mainScreen].bounds.size.width == 375.f && [UIScreen mainScreen].bounds.size.height == 812.f ? YES : NO)
    //判断是否是iPhoneX
    //判断iPHoneXr
#define iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
    //判断iPhoneXs
#define iPhoneXs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
    //判断iPhoneXs Max
#define IiPhoneXs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
#define kHomeBarHeight ((iPhoneX||iPhoneXr||iPhoneXs||IiPhoneXs_Max) ? 34.0f : 0.0f)
#define BottomViewH (kHomeBarHeight+55.0f)
#define kStatusBarHeight ((iPhoneX||iPhoneXr||iPhoneXs||IiPhoneXs_Max) ? 44.0f : 20.0f)
#define NavHeight (kStatusBarHeight+44.0f)
#define NavBtnCenterY (kStatusBarHeight+44.0f/2)


#define LeftMargin 10
#define contentX (75)//与LeftMargin配套

#define LeftMargin_HasTopPic (40)
#define contentX_HasTopPic (105)//与LeftMargin_HasTopPic配套
#define APPCorner (5.8)
#define top_picH (108)
#define per_tfh (68)
#define per_areah (158)
#define per_para_line_h (27)
#define AddCell_TFLab_X (36)
#define attach_areah (50)

#define title_h (75)
#define pic_beijing_h (218)
#define pic_head_h (70)
#define single_TV_Area_h (240)

#define WINDOWH      [[UIScreen mainScreen] bounds].size.height
#define WINDOWW        [[UIScreen mainScreen] bounds].size.width
#define RECT(x,y,w,h)  CGRectMake(x, y, w, h)
#define MoviePercent (9.0/16)

#define sysFont(f)         [UIFont systemFontOfSize:f]
#define font(f)         [UIFont systemFontOfSize:f]
#define boldFont(f)[UIFont boldSystemFontOfSize:f]
#define boldSysFont(f)[UIFont boldSystemFontOfSize:f]

#pragma mark-font
#define TitleFont boldFont(15)//标题字体
#define IntroFont font(12)//介绍字体
#define DecroFont font(10)//装饰字体
#define KeyFont font(12)//key字体
#define ValueFont font(12)//数值字体

#define HomePageCellTitleFont [UIFont systemFontOfSize:15.4]
#define HomePageCellYindaoFont [UIFont systemFontOfSize:14.7]
#define HomePageCellDataFont [UIFont systemFontOfSize:10]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//特殊index宏定义
#define AddManagerClickCellIndex (999)
#define AddAttendClickCellIndex (888)
#define AddAgesAreaClickCellIndex (9999)
#define AddAttachClickCellIndex (666)

#endif /* ViewDefine_h */
