//
//  InfoHelper.h
//  FirstProject
//
//  Created by CZK on 2019/6/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoHelper : NSObject
+(BOOL)onceFlagName:(NSString*)name;
+(void)setOnceFlagName:(NSString*)name;
+(NSString*)preferredProName:(NSString*)name;
+(void)setPreferredFlagName:(NSString*)name value:(NSString*)value;
@end

NS_ASSUME_NONNULL_END
