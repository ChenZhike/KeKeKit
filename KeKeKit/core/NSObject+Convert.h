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
-(id)tryPerformSelWithName:(NSString*)selName;
- (id)performSelector:(SEL)aSelector
          withObjects:(NSArray *)arguments;
@end

NS_ASSUME_NONNULL_END
