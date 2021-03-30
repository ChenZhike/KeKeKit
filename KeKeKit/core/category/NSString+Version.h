//
//  NSString+Version.h
//  KeKeKit
//
//  Created by KeKe on 2021/03/30.
//  Copyright © 2021年 KeKe. All rights reserved.
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
