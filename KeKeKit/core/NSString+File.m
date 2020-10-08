//
//  NSString+File.m
//  FirstProject
//
//  Created by 陈志科 on 2019/12/10.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)
-(BOOL)isimg
{
    NSArray*img_extensions=@[@"png",@"jpg",@"jpeg"];
    NSString*extension=[[self lowercaseString]pathExtension];
    BOOL isimg=[img_extensions containsObject:extension];
    return isimg;
}
-(NSMutableDictionary*)parseBy_QianTao_One
{
//
    NSString*path=[[NSBundle mainBundle]pathForResource:self ofType:nil];
    NSString*target=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //去掉所有刚刚
    target=[target stringByReplacingOccurrencesOfString:@"//" withString:@""];

    //换行符连续两次为单位，分割
    NSArray*parts=[target componentsSeparatedByString:@"\n\n"];

    NSMutableDictionary*result=[[NSMutableDictionary alloc]init];
//    NSMutableString*shuxings=[[NSMutableString alloc]initWithString:@""];
//    NSMutableString*shuxing_dics=[[NSMutableString alloc]initWithString:@""];
//    [shuxing_dics appendString:@"@{"];
    for (NSString*apart in parts) {
        if (apart.length) {
            //第一行的内容作为name
            NSArray*hangs=[apart componentsSeparatedByString:@"\n"];
            NSString*name=hangs[0];
            if ([name hasSuffix:@":"]) {
                name=[name substringToIndex:name.length-1];
            }
            //后面的作为value
            NSString*value=[apart substringFromIndex:name.length];
            //换行符替换为***
            value=[value stringByReplacingOccurrencesOfString:@"\n" withString:@"。"];
            value=[value stringByReplacingOccurrencesOfString:@"@\"。" withString:@"@\""];
            if (name&&value) {
                [result setObject:value forKey:name];
            }
        }

    }
    return result;
//    NSString*qudouhao=[shuxing_dics substringToIndex:shuxing_dics.length-1];
//    [shuxing_dics setString:qudouhao];
//    [shuxing_dics appendString:@"}"];

}
-(NSArray*)parseBy_DanHang_Just
{
//
    NSString*path=[[NSBundle mainBundle]pathForResource:self ofType:nil];
    NSString*target=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //去掉所有刚刚
    target=[target stringByReplacingOccurrencesOfString:@"//" withString:@""];

    //换行符为单位，分割
    NSArray*result=[target componentsSeparatedByString:@"\n"];
    return result;
}
- (NSArray*)ParseByQianTaoValuesToArr
{
    //
        NSString*path=[[NSBundle mainBundle]pathForResource:self ofType:nil];
        NSString*target=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        //去掉所有刚刚
        target=[target stringByReplacingOccurrencesOfString:@"//" withString:@""];

        //换行符连续两次为单位，分割
        NSArray*parts=[target componentsSeparatedByString:@"\n\n"];

    NSMutableArray*result=[[NSMutableArray alloc]init];
        for (NSString*apart in parts) {
            if (apart.length) {
                //第一行的内容作为name
                NSArray*hangs=[apart componentsSeparatedByString:@"\n"];
                NSString*name=hangs[0];
                if ([name hasSuffix:@":"]) {
                    name=[name substringToIndex:name.length-1];
                }
                //后面的作为value
                NSString*value=[apart substringFromIndex:name.length];
                NSArray*values=[value componentsSeparatedByString:@"，"];
                [result addObjectsFromArray:values];

            }

        }
        return result;
}
@end
