//
//  UserInfoTool.h
//  KeKeKit
//
//  Created by KeKe on 3018/10/11.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoTool : NSObject
+(int)getNewValueWithKey:(NSString*)key isAutoSave:(BOOL)isautoSave;
+(int)getNewValueWithKey:(NSString*)key;
+(int)getNewValueAutoSaveWithKey:(NSString*)key;
@end
