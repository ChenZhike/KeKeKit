//
//  UserInfoManager.m
//  JinZi
//
//  Created by KeKe on 15/12/30.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import "UserInfoManager.h"
#import "NetObj.h"
#define MaxUserLevelNum (5)
//static BOOL isRequestUserInfo=false;
static NSString*shareduserHeadInfoString=nil;
static NSString*token=nil;
static NSString*loginType=nil;
@implementation UserInfoManager
#pragma mark-基本信息区
+(BOOL)isVisitAccount
{
    NSString*loginType=[UserInfoManager getLoginType];
    BOOL isVisitAccount=[loginType isEqualToString:@"2"];
    return isVisitAccount;
}

+(NSString*)getLoginType
    //获取值
{
    return loginType;
}
+(void)loadLoginType
{
    NSString*loginType0=[[NSUserDefaults standardUserDefaults]objectForKey:@"loginType"];
    if (loginType0) {
        loginType=loginType0;
    }
}
+(void)setLoginType:(NSString*)loginType0
{
    if (loginType0==nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"loginType"];
        loginType=nil;
    }
    else
        {
        loginType=[loginType0 mutableCopy];
        [self setUserInfo:@{@"loginType":loginType0}];
        }

}
+(NSString*)getToken{//获取token值
    return token;
}
+(BOOL)hasToken
{
    return [UserInfoManager getToken].length>0;
}
+(void)loadToken
{
    NSString*token0=[[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    if (token0) {
        token=token0;
    }
}
+(void)setToken:(NSString*)token0
{
    if (token0==nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
        token=nil;
    }
    else
        {
        token=[token0 mutableCopy];
        [self setUserInfo:@{@"token":token0}];
        }

}
+ (void)setUserInfo:(NSDictionary*)info
{
    for (NSString*key in info.allKeys) {
        NSObject*value=[info objectForKey:key];
        [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    }
        [[NSUserDefaults standardUserDefaults]synchronize];
}
+(NSObject*)getUserInfoWithKey:(NSString*)key
{
    NSObject*value=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    return value;
}
#pragma mark-个人信息
+(BOOL)isVIP
{
BOOL isvip = [[(NSDictionary*)[self getUserInfoWithKey:@"memberInfo"] objectForKey:@"isVip"]boolValue];
    return isvip;
}
+(NSString*)getPortrait
{
    NSString* imageFile = [(NSDictionary*)[self getUserInfoWithKey:@"memberInfo"] objectForKey:@"headpic"];
    if (imageFile.length == 0) {
        imageFile=@"ic_head_s";
    }
    return imageFile;
}
+(int)maxUserLevelNum
{
    return MaxUserLevelNum;
}
@end
