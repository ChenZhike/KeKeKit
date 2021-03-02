    //
    //  NSMutableDictionary+Null.h
    // KeKeKit
    //
    //  Created by KeKe on 15/6/12.
    //  Copyright (c) 2015年 情缘网吧网络. All rights reserved.
    //

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Null)
- (void)setObjectWithoutNull:(id)anObject forKey:(id <NSCopying>)aKey;
-(void)airuike_sexWithSexIndex:(int)sex_index;
-(void)appendIdsStrWithDicArr:(NSArray*)dic_arr dic_idkey:(NSString*)dic_idkey parameter_idskey:(NSString*)parameter_idskey;
-(void)setObjWithKey:(NSString*)key withOldKey:(NSString*)oldkey;
@end
