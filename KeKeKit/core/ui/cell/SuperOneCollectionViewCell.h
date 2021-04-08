//
//  SuperOneCollectionViewCell.h
//  KeKeKit
//
//  Created by CZK on 2019/9/20.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SuperOneCollectionViewCell;
@protocol SuperOneCollectionViewCellDelegate
-(void)SuperOneCollectionViewCell:(SuperOneCollectionViewCell*)cell clickAction:(int )index;
@end
NS_ASSUME_NONNULL_BEGIN
@interface SuperOneCollectionViewCell : UICollectionViewCell
- (void)configWithData:(NSDictionary *)obj;
@end

NS_ASSUME_NONNULL_END
