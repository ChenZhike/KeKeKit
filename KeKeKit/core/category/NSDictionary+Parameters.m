    //
    //  NSDictionary+Parameters.m
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/16.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import "NSDictionary+Parameters.h"

@implementation NSDictionary (Parameters)
-(NSDictionary*)getParametersWithValues:(NSArray*)values
{
    NSArray *keysArray = [self allKeys];
    NSArray *resultArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {

        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
    for (int i=0;i<resultArray.count;i++) {
        NSString*key=resultArray[i];
        NSObject*value=values[i];
        [mudic setObject:value forKey:key];
    }
    return mudic;
}
-(NSMutableDictionary*)replaceKey:(NSString*)key withObject:(NSObject*)obj
{
    NSMutableDictionary*dic1=[[NSMutableDictionary alloc]init];
    [dic1 setValuesForKeysWithDictionary:self];
    [dic1 setObject:obj forKey:key];
    return dic1;
}
-(NSString*)realServerIdWithPlaceStr:(NSString*)placeStr
{
    return  [self realStrWithKeys:[GlobalConst idKeys] placeStr:placeStr];
}
-(NSString*)realServerNameWithPlaceStr:(NSString*)placeStr
{
    return  [self realStrWithKeys:@[@"name",@"className",@"cardName"] placeStr:nil];
}

-(NSString*)realStrWithKeys:(NSArray*)keys placeStr:(NSString*)placeStr
{
    NSString*result=nil;
    for (NSString*key in keys) {
        result=[self objectForKey:key];
        if ([result isKindOfClass:[NSNumber class]]) {
            result=[(NSNumber*)result stringValue];
        }
        if (result.length>0) {
            break;
        }
    }
    if (result.length==0) {
        result=placeStr;
    }
    return result;
}
-(NSArray*)realArrWithKeys:(NSArray*)keys
{
    NSArray*result=nil;
    for (NSString*key in keys) {
        result=[self objectForKey:key];
        if (result!=nil) {
            break;
        }
    }
    return result;
}
-(NSString*)firstEmptyWordsWithKeys:(NSArray*)no_empty_keys words:(NSArray*)no_empty_words
{
        //非空
    NSString*result=nil;
    for (int i=0; i<no_empty_keys.count; i++) {
        NSString*key=no_empty_keys[i];
        NSObject*obj=[self objectForKey:key];
        BOOL is_empty=NO;
        if (obj==nil) {
            is_empty=YES;
        }else if([obj isKindOfClass:[NSString class]])
            {
            is_empty=((NSString*)obj).length==0;
            }
        else if([obj isKindOfClass:[NSArray class]])
            {
            is_empty=((NSArray*)obj).count==0;
            }
        if (is_empty) {
            result=no_empty_words[i];
            break;
        }
    }
    return result;
}
-(void)replaceOldKeyNames:(NSArray*)oldkeys withNowKeyNames:(NSArray*)nowkeys
{
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary*mudic=(NSMutableDictionary*)self;
        for (int i=0; i<oldkeys.count; i++) {
            NSString*oldkey=oldkeys[i];
            NSString*nowkey=nowkeys[i];
            id obj=[self objectForKey:oldkey];
            if (obj) {
                [mudic setObject:obj forKey:nowkey];
                [mudic removeObjectForKey:oldkey];
            }
        }
    }

}
-(void)replaceToShiFouStrWithKey:(NSString*)shifou_key
{
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary*mudic=(NSMutableDictionary*)self;
        BOOL is=[[mudic objectForKey:shifou_key] intValue]==1;
        [mudic setObject:is?@"是":@"否" forKey:shifou_key];
    }
}
-(void)replaceToAgeStr
{
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary*mudic=(NSMutableDictionary*)self;
        NSString*age_key=@"age";
        NSString*now_age=[NSString stringWithFormat:@"%@岁",[mudic objectForKey:age_key]];
        [mudic setObject:now_age forKey:age_key];
    }
}
-(NSString*)sexStr
{
    int sex=[[self objectForKey:@"sex"]intValue];
    NSString*sex_str=(sex==1)?@"男":@"女";
    return sex_str;
}
-(NSDictionary*)ensureOnlyOneData
{
    NSDictionary*data=[self objectForKey:@"data"];
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary*data_data=[data objectForKey:@"data"];
        if (!data_data) {
            data=self;
        }
    }
    else
        {
        data=self;
        }
    return data;
}
-(NSArray*)parseToArrayWithInputDicKey:(NSString*)key
{
        //替换中文为英文
    NSString*str=[self objectForKey:key];
    NSArray*result=[str parseToArrayWithInputText];
    return result;
}
-(NSMutableDictionary*)getDicFromInputDicWithMust_just_keys:(NSArray*)must_just_keys
                                            maybe_just_keys:(NSArray*)maybe_just_keys
                                              must_arr_keys:(NSMutableArray*)must_arr_keys
                                             maybe_arr_keys:(NSArray*)maybe_arr_keys
{
    NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
        //必定有的字符串
        //    NSArray*must_just_keys=@[@"name"];
    for (int i=0; i<must_just_keys.count; i++) {
        NSString*key=must_just_keys[i];
        [mudic setObject:[self objectForKey:key] forKey:key];
    }
        //可能有的字符串
        //    NSArray*maybe_just_keys=@[@"remark"];
    for (int i=0; i<maybe_just_keys.count; i++) {
        NSString*key=maybe_just_keys[i];
        NSString*obj=[self objectForKey:key];
        if (obj) {
            [mudic setObject:obj forKey:key];
        }

    }
        //必定有的要转数组的字符串
        //可能有的要转数组的字符串
    for (int i=0; i<maybe_arr_keys.count; i++) {
        NSString*key=maybe_arr_keys[i];
        NSString*obj=[self objectForKey:key];
        if (obj.length) {
            [must_arr_keys addObject:key];
        }
    }

    for (int i=0; i<must_arr_keys.count; i++) {
        NSString*key=must_arr_keys[i];
        NSArray*obj_arr=[self parseToArrayWithInputDicKey:key];
        [mudic setObject:obj_arr forKey:key];
    }
    return mudic;
}
@end
