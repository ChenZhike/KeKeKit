//
//  NSMutableArray+Change.m
//  FirstProject
//
//  Created by CZK on 2019/12/15.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSMutableArray+Change.h"

@implementation NSMutableArray (Change)
-(void)inverseObjWhetherContains:(id)obj
{
    BOOL contains=[self containsObject:obj];
    if (contains) {
        [self removeObject:obj];
    }
    else
        {
        [self addObject:obj];
        }
}
-(void)removeFirstObj:(NSObject*)obj
{
    NSInteger index=[self indexOfObject:obj];
    if (index!=NSNotFound) {
        [self removeObjectAtIndex:index];
    }
}
@end
