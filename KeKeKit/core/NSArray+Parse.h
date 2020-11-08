//
//  NSArray+Parse.h
//  FirstProject
//
//  Created by CZK on 2019/12/12.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Parse)

/**
 自身里的对象都是文件完整路径字符串

 @return 返回里面都是nsurl对象的数组
 */
-(NSArray*)parsetToFileUrlArray;
-(NSMutableArray*)randomSort;
-(NSArray*)arrayWithTopCount:(int)count;
-(id)firstRepeatedObj;
-(NSMutableArray*)objsWithDicKey:(NSString*)key;
-(NSMutableArray*)lastobjsInSonArrs;
-(NSMutableArray*)noEmptyStrArr;
-(NSMutableArray*)plusArr:(NSArray*)arr;
-(NSArray*)noWhiteEleArray;
@end

NS_ASSUME_NONNULL_END
