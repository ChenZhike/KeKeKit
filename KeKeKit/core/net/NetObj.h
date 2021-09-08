    //
    //  NetObj.h
    //  LaLaLa
    //
    //  Created by keke on 15/10/27.
    //  Copyright © 2015年 keke. All rights reserved.


#import <Foundation/Foundation.h>
# define APPURL [GlobalConst Server_Url]
#define NeedEncryptServerData (NO)
#define  NetObjTagKey @"NetObjTagKey"

typedef void (^netResponseBlock)(NSDictionary *resnfo);
typedef enum : NSUInteger {
    NetObjHttpMethodAuto=0,//自动，由于苹果的post请求bug，NetObj当下会根据参数长度自动决定是使用get或Post。
    NetObjHttpMethodGet=1,//get方法,估计当下用不着
    NetObjHttpMethodPost=2//Post方法，用于支持强行设置post方法。
} NetObjHttpMethod;
@interface NetObj : NSObject
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,strong)NSMutableURLRequest *req;
@property(nonatomic,strong)NSURLSessionTask* task;
@property(nonatomic,copy)netResponseBlock nblock;
@property(nonatomic,assign)int obj_tag;
@property(nonatomic,copy)NSString*urlstr;
@property(nonatomic,strong)NSDictionary* parameters;
@property(nonatomic,assign)BOOL responsed;
- (id)initWithUrlInfo:(NSDictionary*)urlinfo Block:(netResponseBlock)block;
- (id)initWithUrl:(NSString*)url parameters:(NSDictionary*)parameters Block:(netResponseBlock)block;
- (void)start;
-(void)cancel;
+(BOOL)ok_return:(NSDictionary*)resnfo;//当responseed为yes时才有意义
@end
