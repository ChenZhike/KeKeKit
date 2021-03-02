//
//  NSArray+IndexAndStr.h
//  KeKeKit
//
//  Created by KeKe on 15/12/16.
//  Copyright © 2015年 keke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (IndexAndStr)
-(id)objectAtIndexInArr:(NSUInteger)index;
-(NSString*)concactToAskSentence;
-(NSArray*)allAddPrefix:(NSString*)prefix;
-(NSString*)concactStrsWithStr:(NSString*)seperator;
@end
