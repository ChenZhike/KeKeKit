//
//  FileTool.m
//  VideoEditSystem
//
//  Created by CZK on 2017/10/5.
//  Copyright © 2017年 czk. All rights reserved.
//

#import "FileTool.h"

@implementation FileTool
+ (NSString*)diskStrOfAllSizeMBytes:(NSString*)filepath
{
    NSString*resultStr=nil;
    NSError *error;
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:filepath error:&error];
    if (error) {
#ifdef DEBUG
        NSLog(@"error: %@", error.localizedDescription);
#endif
    }else{
     unsigned long long   size=[dic fileSize];
        resultStr=[self getMStrWithBytes:size];

    }
    return resultStr;
}
+(NSString*)getMStrWithBytes:(unsigned long long )size
{
    NSString*resultStr=nil;
    if (size<1024) {
        resultStr=[NSString stringWithFormat:@"%llu字节",size];
    }
    else if (size<1024*1024)
        {
        resultStr = [NSString stringWithFormat:@"%lluK",size/1024];
        }
    else if (size<1024*1024*1024)
        {
        resultStr = [NSString stringWithFormat:@"%.1fM",(CGFloat)size/1024/1024];
        }
    else
        {
        resultStr = [NSString stringWithFormat:@"%lluG",size/1024/1024/1024];
        }
    return resultStr;
}
+ (NSString*)dirDiskStrOfAllSizeMBytes:(NSString*)dirpath
{
    NSError*error=nil;
   NSArray*subpaths= [[NSFileManager defaultManager]subpathsOfDirectoryAtPath:dirpath error:&error];
  unsigned  long long totalbytes=0;
    if (!error) {
        for (int i=0; i<subpaths.count; i++) {
            NSString*filename=subpaths[i];
            NSString*path=[dirpath stringByAppendingPathComponent:filename];
            NSDictionary*filedic=[[NSFileManager defaultManager]attributesOfItemAtPath:path error:nil];
           long long filesize= [filedic fileSize];
            totalbytes+=filesize;
        }
        NSString*resultstr=[self getMStrWithBytes:totalbytes];
        return resultstr;

    }
    else
        {
        return @"";
        }

}
-(BOOL)isimgFileExtension:(NSString*)filestr
{
    NSArray*img_extensions=@[@"png",@"jpg",@"jpeg"];
    NSString*extension=[[filestr lowercaseString]pathExtension];
    BOOL isimg=[img_extensions containsObject:extension];
    return isimg;
}
#pragma mark-加载文件内容
+(NSArray*)getSpecialSep:(NSString*)sep ArrayContentWithBundleFileName:(NSString*)name
{
    NSString*path=[[NSBundle mainBundle]pathForResource:name ofType:nil];
    NSString*content=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray*arr=[content componentsSeparatedByString:sep];
    return arr;
}
+(NSArray*)getArrayContentWithBundleFileName:(NSString*)name
{
    return [self getSpecialSep:@"\n" ArrayContentWithBundleFileName:name];
}
+(NSArray*)getKVsContentWithBundleFileName:(NSString*)name
{
    NSArray*arr=[self getArrayContentWithBundleFileName:name];
    NSMutableArray*result=[[NSMutableArray alloc]init];
//    [result addObjectsFromArray:self];
    for (int i=0; i<arr.count; i++) {
        NSString*hang=arr[i];
        NSDictionary*dic=[hang kvDic];
        [result addObject:dic];
    }
    return result;
}
@end
