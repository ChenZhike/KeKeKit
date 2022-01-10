
    //
    //  NetObj.m
    //  KeKeKit
    //
    //  Created by keke on 15/10/27.
    //  Copyright © 2015年 keke. All rights reserved.

#define NetObjTimeOutInterval 30
#import "NetObj.h"
//#import "LoginVC.h"
#import "SVProgressHUD.h"
#import "HDeviceIdentifier.h"
#import <CommonCrypto/CommonDigest.h>
#import "RNDecryptor.h"

#pragma mark-netobj
NSString * const NetObjCodeTokenNeedInt=@"NetObjCodeTokenNeedInt";
NSString * const NetObjTokenExpriedInts=@"NetObjTokenExpriedInts";
NSString * const NetObjCodeRequestSucceedInt=@"NetObjCodeRequestSucceedInt";

static BOOL needEncryptServerData=NO;
    //data密码


@implementation NetObj
{

    NSURLConnection* conn;
    NSMutableData *resultData;
}

    //#pragma mark-定制化请求头
NSData *GetDataForHex(NSString *hex) {
    NSMutableData *data = [NSMutableData new];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [hex length]/2; i++) {
        byte_chars[0] = [hex characterAtIndex:i*2];
        byte_chars[1] = [hex characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}

+(void)initConsts:(BOOL)is_needEncryptServerData
{
    needEncryptServerData=is_needEncryptServerData;
}



- (id)initWithUrlInfo:(NSDictionary*)urlinfo Block:(netResponseBlock)block
{
    self= [self initWithBlock:block];
    self.urlstr=[urlinfo objectForKey:URLKeyName];
    self.parameters=[urlinfo objectForKey:ParametersKeyName];
    return self;
}
- (id)initWithUrl:(NSString*)url parameters:(NSDictionary*)parameters Block:(netResponseBlock)block
{
    self= [self initWithBlock:block];
    self.urlstr=url;
    self.parameters=parameters;
    return self;
}
- (id)initWithBlock:(netResponseBlock)block
{
    if (self = [super init]) {
        _nblock = block;
    }
    return self;
}
#pragma mark-核心方法
- (void)start
{
        //    dispatch_async(dispatch_get_main_queue(), ^{
        //        [SVProgressHUD showWithStatus:@"正在请求..."];
        //    });
    NSString*appurl=[[GlobalConst sharedInstance]server_url];
    NSString*totalurl=[appurl stringByAppendingString:self.urlstr];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:totalurl]];
    [req setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    self.req=req;
    req.timeoutInterval=30;
    [req setHTTPMethod:@"POST"];
    [self insertCommonHeaderField:req];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (!self.parameters) {
        self.parameters=[[NSDictionary alloc]init];
    }
    [self parameterInsertCommonField];
    NSData *data = [NSJSONSerialization dataWithJSONObject:self.parameters options:NSJSONWritingPrettyPrinted error:nil];
    req.HTTPBody = data;

    __block __weak NetObj*no=self;
    NSURLSessionDataTask*datatask=  [[NSURLSession sharedSession]dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [no performSelectorOnMainThread:@selector(dealWithResultData:) withObject:data waitUntilDone:NO];
    }];
    self.task=datatask;
    [datatask resume];

}
-(void)insertCommonHeaderField:(NSMutableURLRequest*)murequest
{
    if ([UserInfoManager getToken].length) {
        [murequest setValue:[UserInfoManager getToken] forHTTPHeaderField:@"token"];
    }
}
-(void)parameterInsertCommonField
{
        //获取唯一设备标识
    NSString *deviceIdentifier = [HDeviceIdentifier deviceIdentifier];
        //    NSLog(@"唯一设备标识:%@",deviceIdentifier);
    NSMutableDictionary*mudic=[NSMutableDictionary dictionaryWithDictionary:self.parameters];
    [mudic setObject:deviceIdentifier forKey:@"deviceCode"];
    self.parameters=mudic;
}
-(void)cancel
{
    [self.task cancel];
        //    [SVProgressHUD dismiss];
}
+(NSDictionary*)defaultDic
{
    return  @{
        NetObjCodeRequestSucceedInt:@(200)
        ,NetObjCodeTokenNeedInt:@(800)
        ,NetObjTokenExpriedInts:@[@(801),@(401)]
    };

}
-(void)dealWithResultData:(NSData*)resultData
{
    self.responsed=YES;
    NSString *strResult = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    strResult = [strResult stringByReplacingOccurrencesOfString:@":null" withString:@":\"\""];
    NSData *jsonData = [strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dicFromJson = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
    [mudic setValuesForKeysWithDictionary:dicFromJson];
    [mudic setObject:@(self.obj_tag) forKey:NetObjTagKey];
    dicFromJson=mudic;
    if (dicFromJson==nil) {
        [SVProgressHUD showErrorWithStatus:@"当前网络异常，请检查网络设置"];
        [ListCellRequestManager sharedInstance].is_request_body=NO;
        return;
    }
    int returncode = [[dicFromJson objectForKey:@"httpCode"] intValue];
    int code_no=[[InfoHelper preferredProName:NetObjCodeTokenNeedInt]intValue];
    NSArray*token_expires=[InfoHelper preferredProName:NetObjTokenExpriedInts];
    int succeed_code=[[InfoHelper preferredProName:NetObjCodeRequestSucceedInt]intValue];
    if (returncode == code_no) {
            //        _nblock(nil);
        [SVProgressHUD showErrorWithStatus:@"未能获取token"];
        [ChangeVCManager showLogin];
    }else if ([token_expires containsObject:@(returncode)]) {//token失效
                                                     //        _nblock(nil);
                                                     //        BOOL isVisitAccount =[UserInfoManager isVisitAccount];
        [UserInfoManager setToken:nil];
        [UserInfoManager setLoginType:nil];
        [SVProgressHUD showErrorWithStatus:@"您需要重新登录"];
//        KeKeAppDelegate*appdelegate=(KeKeAppDelegate*)[UIApplication sharedApplication].delegate;
//        [appdelegate firstRequest];
            //        if (!isVisitAccount) {
        [ChangeVCManager showLogin];
            //        }
    }else if (returncode == succeed_code) {//
          //添加tag
          NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
          [mudic setValuesForKeysWithDictionary:dicFromJson];
          [mudic setObject:@(self.obj_tag) forKey:NetObjTagKey];
        if (needEncryptServerData) {
            BOOL needjiemi=[dicFromJson.allKeys containsObject:@"data"];
            if (needjiemi) {
                    //解密替换
                NSString *password = [[GlobalConst sharedInstance]CSPWDSTRING];
                NSString *messageString = [dicFromJson objectForKey:@"data"];

                NSData *message = GetDataForHex(messageString);

                NSError *error;
                NSData *decrypted = [RNDecryptor decryptData:message withPassword:password error:&error];
                NSString*nowstr=[[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
                nowstr = [nowstr stringByReplacingOccurrencesOfString:@":null" withString:@":\"\""];
                NSData *ajsondata = [nowstr dataUsingEncoding:NSUTF8StringEncoding];

                    //
                NSDictionary *adic = [NSJSONSerialization JSONObjectWithData:ajsondata options:kNilOptions error:nil];
                NSMutableDictionary*mudic=[[NSMutableDictionary alloc]initWithDictionary:dicFromJson];
                [mudic setObject:adic forKey:@"data"];

                _nblock(mudic);
                    //            orgin_data
                    //传递
            }
            else
                {
                _nblock(dicFromJson);//
                }
        }
        else
            {
            _nblock(dicFromJson);//
            }



    }
    else
        {
        __block  NSString*message=[dicFromJson objectForKey:@"msg"];
        if (message.length==0) {
                    message=@"服务异常，请稍后重试";
                }
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:message];
        });

            //_nblock(nil);
        }
    [ListCellRequestManager sharedInstance].is_request_body=NO;
}
+(BOOL)ok_return:(NSDictionary*)resnfo
{
    NSString*retCode=[resnfo objectForKey:@"retCode"];
    int code=[[InfoHelper preferredProName:NetObjCodeRequestSucceedInt]intValue];
//    code
    BOOL result=(code==[retCode intValue]);
    return result;
}

@end
