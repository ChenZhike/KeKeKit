//
//  NSString+Version.h
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Version)
/**
 compare two version
 @param sourVersion *.*.*.*
 @param desVersion *.*.*.*
 @returns No,sourVersion is less than desVersion; YES, the statue is opposed
 */
+(BOOL)compareVerison:(NSString *)sourVersion withDes:(NSString *)desVersion;
@end
