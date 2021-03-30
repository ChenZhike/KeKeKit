//
//  CollectCenter.m
//  KeKeKit
//
//  Created by CZK on 2019/6/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import "CollectCenter.h"
static CollectCenter*sharedCollectCenter=nil;
static NSString*collect_filename=@"collect_filename";
@implementation CollectCenter
+(CollectCenter*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCollectCenter=[[CollectCenter alloc]init];
    });
    return sharedCollectCenter;
}
-(id)init
{
    if (self=[super init]) {
        self.dac=[[DiskArrayCenter alloc]initWithName:collect_filename];
    }
    return self;
}
-(NSArray*)collects_ids
{
    return self.dac.objs;
}
-(void)tryAddCollect:(NSString*)tid
{
    [self.dac addObj:tid];
}
-(void)cancelCollect:(NSString*)tid
{
    [self.dac removeObj:tid];
}
-(BOOL)isCollect:(NSString*)tid
{
   return  [self.dac.objs containsObject:tid];
}



@end
