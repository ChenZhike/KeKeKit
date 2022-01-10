//
//  GlobalConst.m
//  TransparentGuidePage
//
//  Created by wangqibin on 2018/4/21.
//  Copyright © 2018年 sensmind. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark-引导区
NSString * const shownProtocol = @"shownProtocol";
NSString * const closeProtoclnotiname=@"closeProtoclnotiname";
NSString * const shownguide = @"Guide_Mine_Share";
NSString * const closeguidenotiname = @"Guide_Cards_Share";
NSString * const current_xingxiang_text_key = @"current_xingxiang_text_key";
NSString * const ADFineshNotiName = @"ADFineshNotiName";


NSString * const tuichuLoginNotiName = @"tuichuLoginNotiName";
NSString * const shibieQRCodeSuccess = @"shibieQRCodeSuccess";




NSString * const bianhaoKeyName=@"bianhao";//编号字段名字
NSString * const imgKeyName=@"imgs";
NSString * const last_see_timeKeyName=@"last_see_timeKeyName";//上次浏览时间字段名字

#pragma mark-数据区
NSString * const CommonCellTypekey = @"CommonCellTypekey";//活动cell类型
NSString * const AttachCellTypekey=@"AttachCellTypekey";//附件cell类型
NSString * const ImgTypekey=@"ImgTypekey";//图片类型key,通用的
NSString * const FullFillPvDatasCellTypekey=@"FullFillPvDatasCellTypekey";//填充pickerviews的datas的key
static NSString* earnurl=nil;

static NSString*back_icon_str=nil;





static GlobalConst*sharedGlobalConst=nil;
@implementation GlobalConst : NSObject
    //.m:
+(GlobalConst*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGlobalConst=[[GlobalConst alloc]init];
    });
    return sharedGlobalConst;
}


+(NSString*)getEarnUrl
{
    return earnurl;
}
+(void)setEarnUrl:(NSString*)aearnUrl
{
    earnurl=aearnUrl;
}
+(NSArray*)idKeys
{
        //    班级类型 1=临时班 2=正式班 3=体验班
    return @[@"id",@"value",@"clueUserId"];
}
+(NSString*)ProtocolUrl
{
    return @"";
}
@end

