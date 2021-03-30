//
//  NSArray+Compare.h
//  KeKeKit
//
//  Created by CZK on 2019/6/14.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Compare)
-(BOOL)insetWithArray:(NSArray*)arr;
-(NSMutableArray*)insetArrayWithArray:(NSArray*)arr;
-(NSUInteger)countOfObj:(NSObject*)obj;

/**
 级联compare，从高到低，从0到arr.count-1

 @param arr 里面全是number对象
 @return 返回比较结果
 */
-(NSComparisonResult)jilianCompareNums:(NSArray*)arr;
-(NSString*)nextStrWithNowStr:(NSString*)nowstr;
@end

NS_ASSUME_NONNULL_END
