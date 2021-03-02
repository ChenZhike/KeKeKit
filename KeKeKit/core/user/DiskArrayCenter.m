//
//  DiskArrayCenter.m
//  FirstProject
//
//  Created by CZK on 2019/6/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import "DiskArrayCenter.h"

@implementation DiskArrayCenter
-(id)initWithName:(NSString*)name
{
    if (self=[super init]) {
        self.name=name;
        self.filepath=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),self.name];
    }
    return self;
}
-(NSMutableArray*)objs
{
    if (_objs==nil) {
        _objs=[NSMutableArray arrayWithContentsOfFile:self.filepath];
        if (_objs==nil) {
            _objs=[[NSMutableArray alloc]init];
        }
    }
    return _objs;
}
-(void)addObj:(NSObject*)obj
{
    NSMutableArray*objs=self.objs;
    [objs addObject:obj];


    [self save];
}
-(void)removeObj:(NSObject*)obj
{
    [self.objs removeObject:obj];
    [self save];
}

-(BOOL)containsKey:(NSString*)key value:(NSString*)value
{
    NSUInteger index=[self indexWithKey:key value:value];

    BOOL result=(index!=NSNotFound);
    return result;
}
-(NSInteger)indexWithKey:(NSString*)key value:(NSString*)value
{
    NSInteger result=NSNotFound;

    for (int i=0; i<self.objs.count; i++) {
        NSObject*obj=self.objs[i];
        NSString*value0=[obj valueForKey:key];
        if ([value0 isEqualToString:value]) {
            result=i;
            break;
        }
    }
    return result;
}
-(void)replaceObj:(NSObject*)obj atIndex:(int)index
{
    [self.objs replaceObjectAtIndex:index withObject:obj];
}
-(BOOL)save
{
 BOOL is_suc=   [self.objs writeToFile:self.filepath atomically:YES];
    if (!is_suc) {
        showErrorMsg(@"文件写入失败，请确认具有足够的存储空间。");
    }
    return is_suc;
}
@end
