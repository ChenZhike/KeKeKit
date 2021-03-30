//
//  DiskArrayCenter.h
//  KeKeKit
//
//  Created by CZK on 2019/6/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiskArrayCenter : NSObject
-(id)initWithName:(NSString*)name;
@property(nonatomic,copy,nullable)NSString*name;
@property(nonatomic,strong,nullable)NSMutableArray* objs;
@property(nonatomic,copy,nullable)NSString*filepath;
-(void)addObj:(NSObject*)obj;
-(void)removeObj:(NSObject*)obj;
-(NSMutableArray*)objs;
-(void)replaceObj:(NSObject*)obj atIndex:(int)index;
-(BOOL)containsKey:(NSString*)key value:(NSString*)value;
-(NSInteger)indexWithKey:(NSString*)key value:(NSString*)value;
@end

NS_ASSUME_NONNULL_END
