    //
    //  NSMutableDictionary+Null.m
    // KeKeKit
    //
    //  Created by KeKe on 15/6/12.
    //  Copyright (c) 2015年 情缘网吧网络. All rights reserved.
    //

#import "NSMutableDictionary+Null.h"

@implementation NSMutableDictionary (Null)
- (void)setObjectWithoutNull:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (anObject&&anObject!=[NSNull null]) {
        [self setObject:anObject forKey:aKey];
    }
    else
        {
        [self removeObjectForKey:aKey];
        }
}
-(void)airuike_sexWithSexIndex:(int)sex_index
{
    [self setObject:@(sex_index+1) forKey:@"sex"];
}
-(void)appendIdsStrWithDicArr:(NSArray*)dic_arr dic_idkey:(NSString*)dic_idkey parameter_idskey:(NSString*)parameter_idskey
{
    NSMutableString*mustr=[[NSMutableString alloc]initWithString:@""];
    int count=dic_arr.count;
    for (int i=0; i<count; i++) {
        NSDictionary*dic=dic_arr[i];
        NSString*idstr=[[dic objectForKey:dic_idkey]numOrStringValue];
        [mustr appendString:idstr];
            //        if (i!=count-1) {
        [mustr appendString:@","];
            //        }
    }
    [self setObject:mustr forKey:parameter_idskey];
}
-(void)setObjWithKey:(NSString*)key withOldKey:(NSString*)oldkey;
{
    [self setObject:[self objectForKey:oldkey] forKey:key];
}
@end
