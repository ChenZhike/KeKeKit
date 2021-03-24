//
//  FileTool.h
//  VideoEditSystem
//
//  Created by CZK on 2017/10/5.
//  Copyright © 2017年 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileTool : NSObject
+ (NSString*)diskStrOfAllSizeMBytes:(NSString*)filepath;
+ (NSString*)dirDiskStrOfAllSizeMBytes:(NSString*)dirpath;
-(BOOL)isimgFileExtension:(NSString*)filestr;
+(NSArray*)getSpecialSep:(NSString*)sep ArrayContentWithBundleFileName:(NSString*)name;
+(NSArray*)getArrayContentWithBundleFileName:(NSString*)name;
+(NSArray*)getKVsContentWithBundleFileName:(NSString*)name;
@end
