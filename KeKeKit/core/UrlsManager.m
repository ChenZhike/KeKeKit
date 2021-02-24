//
//  UrlsManager.m
//  FirstProject
//
//  Created by KeKe on 3018/9/16.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "UrlsManager.h"
static NSDictionary*local_urls;
@implementation UrlsManager

+(NSDictionary*)urls
{
    if (!local_urls) {
        NSString*path=[[NSBundle mainBundle]pathForResource:@"Urlss" ofType:@"geojson"];
            //正式打包后用这个方法获得网络请求
//                                NSString*originData=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//                                NSString*safeStr= [NSData AES256DecryptWithCiphertext:originData];
//                                NSData*data=[safeStr dataUsingEncoding:NSUTF8StringEncoding];

            //开发时用这段方法
        NSData*data=[[NSData alloc]initWithContentsOfFile:path];
            //
        NSError*error;
        local_urls=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            //正式打包前用这段代码加密url文件
//                    [self encrypt];
    }
    return local_urls;
}
+(void)encrypt
{
    NSString*path=[[NSBundle mainBundle]pathForResource:@"Urlss" ofType:@"geojson"];
    NSString*data=[[NSString alloc]initWithContentsOfFile:path];
    NSString*md5str= [NSData AES256EncryptWithPlainText:data];
    NSString*wpath=[NSString stringWithFormat:@"%@/Documents/urs.geojson",NSHomeDirectory()];
   BOOL write= [md5str writeToFile:wpath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
+(NSDictionary*)getUrlInfoWithKey:(NSString*)key
{
    NSDictionary*urls=[self urls];
    NSDictionary*dic=[urls objectForKey:key];
    return dic;
}
@end
