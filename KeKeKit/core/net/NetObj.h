    //
    //  NetObj.h
    //  LaLaLa
    //
    //  Created by keke on 15/10/27.
    //  Copyright © 2015年 keke. All rights reserved.


#import <Foundation/Foundation.h>
# define APPURL [[GlobalConst sharedInstance]server_url]
//#define NeedEncryptServerData (NO)
#define  NetObjTagKey @"NetObjTagKey"
typedef void (^netResponseBlock)(NSDictionary *resnfo);
typedef enum : NSUInteger {
    NetObjHttpMethodAuto=0,//自动，由于苹果的post请求bug，NetObj当下会根据参数长度自动决定是使用get或Post。
    NetObjHttpMethodGet=1,//get方法,估计当下用不着
    NetObjHttpMethodPost=2//Post方法，用于支持强行设置post方法。
} NetObjHttpMethod;
#pragma mark-netobj
UIKIT_EXTERN NSString * const NetObjCodeTokenNeedInt;
UIKIT_EXTERN NSString * const NetObjTokenExpriedInts;
UIKIT_EXTERN NSString * const NetObjCodeRequestSucceedInt;


/**
 名称|默认|作用
 NetObjRequestSuccess|200|请求成功
 NetObjNoTokenKey|800|没有获取到token
 NetObjTokenExpired|801,401|token失效
 */

@interface NetObj : NSObject
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,strong)NSMutableURLRequest *req;
@property(nonatomic,strong)NSURLSessionTask* task;
@property(nonatomic,copy)netResponseBlock nblock;
@property(nonatomic,assign)int obj_tag;
@property(nonatomic,copy)NSString*urlstr;
@property(nonatomic,strong)NSDictionary* parameters;
@property(nonatomic,assign)BOOL responsed;
+(NSDictionary*)defaultDic;
+(void)initConsts:(BOOL)is_needEncryptServerData;
- (id)initWithUrlInfo:(NSDictionary*)urlinfo Block:(netResponseBlock)block;
- (id)initWithUrl:(NSString*)url parameters:(NSDictionary*)parameters Block:(netResponseBlock)block;
- (void)start;
-(void)cancel;
+(BOOL)ok_return:(NSDictionary*)resnfo;//当responseed为yes时才有意义
@end
