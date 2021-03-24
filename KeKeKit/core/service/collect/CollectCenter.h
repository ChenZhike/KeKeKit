//
//  CollectCenter.h
//  FirstProject
//
//  Created by CZK on 2019/6/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiskArrayCenter.h"
NS_ASSUME_NONNULL_BEGIN

@interface CollectCenter : NSObject
@property(nonatomic,strong,nullable)DiskArrayCenter* dac;
+(CollectCenter*)sharedInstance;
-(NSArray*)collects_ids;
-(void)tryAddCollect:(NSString*)tid;
-(void)cancelCollect:(NSString*)tid;
-(BOOL)isCollect:(NSString*)tid;
@end

NS_ASSUME_NONNULL_END
