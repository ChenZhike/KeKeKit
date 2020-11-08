//
//  NSUserDefaults+Null.h
// KeKeKit
//
//  Created by KeKe on 15/6/12.
//  Copyright (c) 2015年 情缘网吧网络. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Null)
-(void)setObjectWithoutNull:(id)value forKey:(NSString *)defaultName;
@end
