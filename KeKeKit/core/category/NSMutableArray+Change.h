//
//  NSMutableArray+Change.h
//  KeKeKit
//
//  Created by CZK on 2019/12/15.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Change)
-(void)inverseObjWhetherContains:(id)obj;
-(void)removeFirstObj:(NSObject*)obj;
@end

NS_ASSUME_NONNULL_END
