//
//  UserInfoManager.h
//  KeKeKit
//
//  Created by KeKe on 15/12/30.
//  Copyright © 2015年 keke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManager : NSObject
//+(NSString*)getNowMemid;
+(BOOL)isVisitAccount;
+(void)loadToken;
+(NSString*)getLoginType;//获取值
+(void)loadLoginType;
+(void)setLoginType:(NSString*)loginType;
+(NSString*)getToken;//获取token值
+(void)setToken:(NSString*)token0;
+(BOOL)hasToken;
//+(NSDictionary*)getUserinfoDic;
+ (void)setUserInfo:(NSDictionary*)info;
+(NSObject*)getUserInfoWithKey:(NSString*)key;
+(NSString*)getPortrait;
+(BOOL)isVIP;
+(int)maxUserLevelNum;
@end
