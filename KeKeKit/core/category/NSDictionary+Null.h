//
//  NSDictionary+Null.h
//  TestWorkSpace
//
//  Created by KeKe on 15/8/17.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Null)
- (NSString*)StringObjectWithoutNullforKey:(id <NSCopying>)aKey;
- (NSNumber*)NumberObjectWithoutNullforKey:(id <NSCopying>)aKey;
- (int)intObjectWithoutNullforKey:(id <NSCopying>)aKey;
@end
