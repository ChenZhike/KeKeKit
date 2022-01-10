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




//数据字段
UIKIT_EXTERN NSString * const bianhaoKeyName;//编号字段名字
UIKIT_EXTERN NSString * const imgKeyName;//图片字段名字
UIKIT_EXTERN NSString * const last_see_timeKeyName;//上次浏览时间字段名字


    ///数据字段
UIKIT_EXTERN NSString * const CommonCellTypekey;//通用cell类型
UIKIT_EXTERN NSString * const AttachCellTypekey;//附件cell类型
UIKIT_EXTERN NSString * const ImgTypekey;//图片类型key,通用的
UIKIT_EXTERN NSString * const FullFillPvDatasCellTypekey;//填充pickerviews的datas的key






 
@interface GlobalConst:NSObject

+(NSString*)getEarnUrl;
+(void)setEarnUrl:(NSString*)earnUrl;
+(NSArray*)changhe_imgs_prefers;
+(void)setChanghe_imgs_prefers:(NSArray*)arr;
+(NSString*)current_changhe_self_imgs;


+(NSArray*)idKeys;
+(NSString*)ProtocolUrl;
+(GlobalConst*)sharedInstance;
#pragma mark-图片
@property(nonatomic,copy,nullable)NSString*back_icon_str;
#pragma mark-网络请求
@property (nonatomic, copy) NSString*server_url;
@property(nonatomic,copy,nullable)NSString*CSPWDSTRING;
#pragma mark-分享相关
@property (nonatomic, copy) NSString*appid;
@property (nonatomic, copy) NSString*author_email;
@end
