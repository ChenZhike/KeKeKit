//
//  NSObject+Convert.h
//  KeKeKit
//
//  Created by CZK on 2019/4/13.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Convert)
-(NSNumber*)mustNum;
-(NSString*)numOrStringValue;
@end

NS_ASSUME_NONNULL_END
