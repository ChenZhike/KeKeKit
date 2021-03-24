//
//  UserInfoTool.h
//  FirstProject
//
//  Created by KeKe on 3018/10/11.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoTool : NSObject
+(int)getNewValueWithKey:(NSString*)key isAutoSave:(BOOL)isautoSave;
+(int)getNewValueWithKey:(NSString*)key;
+(int)getNewValueAutoSaveWithKey:(NSString*)key;
@end
