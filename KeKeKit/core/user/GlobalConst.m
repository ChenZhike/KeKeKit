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


NSString * const  nochanghe_img_prefer_key=@"nochanghe_img_prefer_key";
NSString * const  work_img_prefer_key=@"work_img_prefer_key";
NSString * const xiuxian_img_prefer_key=@"xiuxian_img_prefer_key";
NSString * const juhui_img_prefer_key=@"juhui_img_prefer_key";
NSString * const yanhui_img_prefer_key=@"yanhui_img_prefer_key";
NSString * const current_changhe_text=@"current_changhe_text";



NSString * const moren=@"默认";
NSString * const kongbai=@"空白";
NSString * const zidingyi=@"自定义";


NSString * const bianhaoKeyName=@"bianhao";//编号字段名字
NSString * const imgKeyName=@"imgs";
NSString * const recomandKeyName=@"recommend";
NSString * const last_see_timeKeyName=@"last_see_timeKeyName";//上次浏览时间字段名字

#pragma mark-数据区
NSString * const CommonCellTypekey = @"CommonCellTypekey";//活动cell类型
NSString * const AttachCellTypekey=@"AttachCellTypekey";//附件cell类型
NSString * const ImgTypekey=@"ImgTypekey";//图片类型key,通用的
NSString * const FullFillPvDatasCellTypekey=@"FullFillPvDatasCellTypekey";//填充pickerviews的datas的key
NSString * const KeShiKeyName=@"KeShiKeyName";//课时key
NSString * const KeJianIdKey=@"KeJianIdKey";//课件idkey
NSString * const KeJianNameKeyName=@"KeJianNameKeyName";//课件名字
NSString * const KeGuNameKeyName=@"courseManagerName";//课程顾问名字
NSString * const ScoreNumsCellTitlesKeyName=@"titles";
NSString * const ScoreNumsCellNumsKeyName=@"nums";
static NSString* earnurl=nil;
static NSString*aserver_url=nil;
@implementation GlobalConst : NSObject
+(UIColor*)topviewBackColor
{
    return [UIColor whiteColor];
}

+(NSArray*)love_colors
{
    return @[@"红",@"橙",@"黄",@"绿",@"蓝",@"紫",@"白",@"黑",@"花"];
}
+(NSArray*)hate_colors
{
    return @[@"白",@"红",@"黑",@"黄",@"橙",@"绿",@"紫",@"蓝",@"花"];
}
+(NSString*)current_changhe_text
{
   NSString*result= [InfoHelper preferredProName:current_changhe_text];
    return result;
}
+(NSArray*)changhe_texts
{
    return @[@"工作",@"休闲",@"聚餐",@"宴会"];
}
+(NSArray*)changhe_imgs
{
    return @[@"gongzuo.jpg",@"xiuxian.jpg",@"jucan.jpg",@"yanhui.jpg"];
}
+(NSString*)current_changhe_self_imgs
{
    NSString*text=[GlobalConst current_changhe_text];
    NSString*filepath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),text ];
    return filepath;
}
+(NSUInteger)current_changhe_index
{
    NSString*text=[self current_changhe_text];
    NSUInteger index=[[self changhe_texts]indexOfObject:text];
    return index;
}
+(NSArray*)changhe_imgs_prefers
{
   NSString*str0= [InfoHelper preferredProName:work_img_prefer_key];
    NSString*str1= [InfoHelper preferredProName:xiuxian_img_prefer_key];
    NSString*str2= [InfoHelper preferredProName:juhui_img_prefer_key];
    NSString*str3= [InfoHelper preferredProName:yanhui_img_prefer_key];
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    [muarr addObject:(str0.length==0?kongbai:str0)];
    [muarr addObject:(str1.length==0?kongbai:str1)];
    [muarr addObject:(str2.length==0?kongbai:str2)];
    [muarr addObject:(str3.length==0?kongbai:str3)];
    return muarr;
}
+(void)setChanghe_imgs_prefers:(NSArray*)arr
{
    [InfoHelper setPreferredFlagName:work_img_prefer_key value:arr[0]];
    [InfoHelper setPreferredFlagName:xiuxian_img_prefer_key value:arr[1]];
    [InfoHelper setPreferredFlagName:juhui_img_prefer_key value:arr[2]];
    [InfoHelper setPreferredFlagName:yanhui_img_prefer_key value:arr[3]];
}
+(NSString*)current_xingxiang_text
{
   return  [InfoHelper preferredProName:current_xingxiang_text_key];
}
+(NSString*)current_xingxiang_img
{
    NSString*text=  [InfoHelper preferredProName:current_xingxiang_text_key];
   NSUInteger index = [[self xingxiang_texts]indexOfObject:text];
   NSString*imgname= [[self xingxiang_imgnames] objectAtIndex:index];
    return imgname;
}
+(void)setCurrent_xingxiang_text:(NSString*)xingxiang_text;
{
    [InfoHelper setPreferredFlagName:current_xingxiang_text_key value:xingxiang_text];
}
+(NSString*)current_xingxiang_words
{
    NSString*filename=[[self current_xingxiang_text]stringByAppendingString:@"密语"];
  NSString*filepath=  [[NSBundle mainBundle]pathForResource:filename ofType:nil];
    NSString*result=[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    return result;
}
+(NSArray*)music_file_names
{
    return @[@"Shallou-Begin.mp3",@"奇异恩典-赤池优.mp3",@"左手指月 (纯享版) - 黄霄雲.mp3"];
}
+(NSArray*)xingxiang_words_file
{
    return @[@"淑女",@"少妇",@"贵妇"];
}
+(NSArray*)xingxiang_texts
{
    return @[@"淑女",@"少妇",@"贵妇"];
}
+(NSArray*)xingxiang_imgnames
{
    return  @[@"淑女.jpeg",@"少妇.jpg",@"贵妇.jpg"];
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
+(NSArray*)return_ok_codes
{
    return @[@"100",@"1"];
}
+(NSString*)Server_Url
{
    return aserver_url;
}
+(void)setServer_Url:(NSString*)aurl_str
{
    aserver_url=[aurl_str mutableCopy];
}
@end

