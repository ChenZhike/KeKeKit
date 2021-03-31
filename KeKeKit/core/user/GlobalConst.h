//
//  GlobalConst.h
//  TransparentGuidePage
//
//  Created by wangqibin on 2018/4/21.
//  Copyright © 2018年 sensmind. All rights reserved.
//
#pragma mark-引导区
#import <UIKit/UIKit.h>
//引导
UIKIT_EXTERN NSString * const shownProtocol;
UIKIT_EXTERN NSString * const closeProtoclnotiname;
UIKIT_EXTERN NSString * const shownguide;
UIKIT_EXTERN NSString * const closeguidenotiname;
UIKIT_EXTERN NSString * const ADFineshNotiName;


UIKIT_EXTERN NSString * const tuichuLoginNotiName ;
UIKIT_EXTERN NSString * const shibieQRCodeSuccess ;

//场合
//UIKIT_EXTERN NSString * const current_xingxiang_text_key;
UIKIT_EXTERN NSString * const  nochanghe_img_prefer_key;
UIKIT_EXTERN NSString * const work_img_prefer_key;
UIKIT_EXTERN NSString * const xiuxian_img_prefer_key;
UIKIT_EXTERN NSString * const juhui_img_prefer_key;
UIKIT_EXTERN NSString * const yanhui_img_prefer_key;
UIKIT_EXTERN NSString * const current_changhe_text;

//偏好类型
UIKIT_EXTERN NSString * const moren;//默认
UIKIT_EXTERN NSString * const kongbai;//空白
UIKIT_EXTERN NSString * const zidingyi;//自定义


//数据字段
UIKIT_EXTERN NSString * const bianhaoKeyName;//编号字段名字
UIKIT_EXTERN NSString * const imgKeyName;//图片字段名字
UIKIT_EXTERN NSString * const last_see_timeKeyName;//上次浏览时间字段名字

//本地文件字段
UIKIT_EXTERN NSString * const goodsFileName;//衣服文件名字

    ///数据字段
UIKIT_EXTERN NSString * const CommonCellTypekey;//通用cell类型
UIKIT_EXTERN NSString * const AttachCellTypekey;//附件cell类型
UIKIT_EXTERN NSString * const ImgTypekey;//图片类型key,通用的


UIKIT_EXTERN NSString * const FullFillPvDatasCellTypekey;//填充pickerviews的datas的key
UIKIT_EXTERN NSString * const KeShiKeyName;
UIKIT_EXTERN NSString * const KeJianIdKey;//课件idkey
UIKIT_EXTERN NSString * const KeJianNameKeyName;
UIKIT_EXTERN NSString * const KeGuNameKeyName;
UIKIT_EXTERN NSString * const ScoreNumsCellTitlesKeyName;
UIKIT_EXTERN NSString * const ScoreNumsCellNumsKeyName;

@interface GlobalConst:NSObject
+(UIColor*)topviewBackColor;
+(NSUInteger)current_changhe_index;
+(NSString*)current_changhe_text;
+(NSArray*)changhe_imgs;
+(NSArray*)love_colors;
+(NSArray*)hate_colors;
+(NSArray*)changhe_texts;
+(NSString*)current_xingxiang_text;
+(NSString*)current_xingxiang_words;
+(NSString*)current_xingxiang_img;
+(NSArray*)music_file_names;
+(void)setCurrent_xingxiang_text:(NSString*)xingxiang_text;
+(NSArray*)xingxiang_texts;
+(NSArray*)xingxiang_imgnames;
+(NSString*)getEarnUrl;
+(void)setEarnUrl:(NSString*)earnUrl;
+(NSArray*)changhe_imgs_prefers;
+(void)setChanghe_imgs_prefers:(NSArray*)arr;
+(NSString*)current_changhe_self_imgs;


+(NSArray*)idKeys;
+(NSString*)ProtocolUrl;
@end
