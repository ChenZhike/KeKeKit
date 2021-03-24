//
//  UserInfoTool.m
//  FirstProject
//
//  Created by KeKe on 3018/10/11.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "UserInfoTool.h"

@implementation UserInfoTool
+(int)getNewValueWithKey:(NSString*)key isAutoSave:(BOOL)isautoSave
{
    NSNumber*obj=[[NSUserDefaults standardUserDefaults ]objectForKey:key];
    if (!obj) {
        [[NSUserDefaults standardUserDefaults]setObject:@(0) forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return 0;
    }
    int oldvalue=[obj intValue];
    if (isautoSave) {
        [[NSUserDefaults standardUserDefaults]setObject:@(oldvalue+1) forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }

    return oldvalue+1;
}
+(int)getNewValueWithKey:(NSString*)key
{
    return [self getNewValueWithKey:key isAutoSave:NO];
}
+(int)getNewValueAutoSaveWithKey:(NSString*)key
{
    return  [self getNewValueWithKey:key isAutoSave:YES];
}
@end
