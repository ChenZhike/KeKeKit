//
//  NSIndexPath+Equal.m
//  Elliriky
//
//  Created by CZK on 2020/8/29.
//  Copyright © 2020 weike. All rights reserved.
//

#import "NSIndexPath+Equal.h"

@implementation NSIndexPath (Equal)
-(BOOL)equalToIndexPath:(NSIndexPath*)indexPath
{
    BOOL result=(self.section==indexPath.section&&self.row==indexPath.row);
    return result;
}
@end
