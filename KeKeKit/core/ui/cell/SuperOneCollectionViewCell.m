//
//  SuperOneCollectionViewCell.m
//  KeKeKit
//
//  Created by CZK on 2019/9/20.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperOneCollectionViewCell.h"

@implementation SuperOneCollectionViewCell
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return 66;
}
- (void)configWithData:(NSDictionary *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.height=h;
    self.contentView.height=h;
}
@end
