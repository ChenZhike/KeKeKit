    //
    //  NSDictionary+Parameters.h
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/16.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import <Foundation/Foundation.h>

@interface NSDictionary (Parameters)
-(NSDictionary*)getParametersWithValues:(NSArray*)values;
-(NSMutableDictionary*)replaceKey:(NSString*)key withObject:(NSObject*)obj;
-(void)replaceOldKeyNames:(NSArray*)oldkeys withNowKeyNames:(NSArray*)nowkeys;
-(void)replaceToShiFouStrWithKey:(NSString*)shifou_key;
-(void)replaceToAgeStr;
-(NSString*)realServerIdWithPlaceStr:(NSString*)placeStr;
-(NSString*)realServerNameWithPlaceStr:(NSString*)placeStr;
-(NSString*)realStrWithKeys:(NSArray*)keys placeStr:(NSString*)placeStr;
-(NSArray*)realArrWithKeys:(NSArray*)keys;
-(NSString*)firstEmptyWordsWithKeys:(NSArray*)no_empty_keys words:(NSArray*)no_empty_words;
-(NSString*)sexStr;
-(NSDictionary*)ensureOnlyOneData;
-(NSArray*)parseToArrayWithInputDicKey:(NSString*)key;
-(NSMutableDictionary*)getDicFromInputDicWithMust_just_keys:(NSArray*)must_just_keys
                                            maybe_just_keys:(NSArray*)maybe_just_keys
                                              must_arr_keys:(NSMutableArray*)must_arr_keys
                                             maybe_arr_keys:(NSArray*)maybe_arr_keys;
@end
