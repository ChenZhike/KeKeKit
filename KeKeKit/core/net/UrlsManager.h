//
//  UrlsManager.h
//  KeKeKit
//
//  Created by KeKe on 3018/9/16.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <Foundation/Foundation.h>
#define URLKeyName @"url"
#define ParametersKeyName @"parameters"
@interface UrlsManager : NSObject
@property(nonatomic,copy)NSString*url;
@property(nonatomic,strong)NSDictionary* parameters;
+(NSDictionary*)urls;
+(NSDictionary*)getUrlInfoWithKey:(NSString*)key;
@end
