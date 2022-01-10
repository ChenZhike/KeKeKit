//
//  KeKeCenter.m
//  KeKeKit
//
//  Created by 陈志科 on 2022/1/10.
//

#import "KeKeCenter.h"

@implementation KeKeCenter
//.m:
static KeKeCenter*sharedKeKeCenter=nil;
+(KeKeCenter*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedKeKeCenter=[[KeKeCenter alloc]init];
        [sharedKeKeCenter initDefault];
    });
    return sharedKeKeCenter;
}
- (void)initDefault
{
    NSArray*titles=@[@"NetObj",@"SkinManager"];
    for (NSString*title in titles) {
        
        Class a=NSClassFromString(title);
        SEL asel=NSSelectorFromString(@"defaultDic");
       NSDictionary* dic= [a performSelector:asel];
        [self makeDefault:dic];
    }
    
    
}
- (void)makeDefault:(NSDictionary*)default_dic
{
    NSArray*keys=default_dic.allKeys;
    for (NSString*akey in keys) {
        id obj=[InfoHelper preferredProName:akey];
        if (obj==nil) {
            id value=[default_dic objectForKey:akey];
            [InfoHelper setPreferredFlagName:akey value:value];
        }
    }
}
@end
