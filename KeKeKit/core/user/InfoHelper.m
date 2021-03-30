//
//  InfoHelper.m
//  KeKeKit
//
//  Created by CZK on 2019/6/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import "InfoHelper.h"

@implementation InfoHelper
+(BOOL)onceFlagName:(NSString*)name
{
  NSObject*obj=  [[NSUserDefaults standardUserDefaults]objectForKey:name];
    return obj!=nil;
}
+(void)setOnceFlagName:(NSString*)name
{
    [self setPreferredFlagName:name value:@""];
}
+(NSString*)preferredProName:(NSString*)name
{
NSString*obj=  [[NSUserDefaults standardUserDefaults]objectForKey:name];
    return obj;
}
+(void)setPreferredFlagName:(NSString*)name value:(NSString*)value
{
[[NSUserDefaults standardUserDefaults]setObject:value forKey:name];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
