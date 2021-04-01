//
//  ListCellRequestManager.h
//  ZiLuoLan
//
//  Created by 陈志科 on 2020/5/25.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import "SuperOneVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListCellRequestManager : SuperOneVC
@property(nonatomic,strong)NSArray* cell_names;
+(ListCellRequestManager*)sharedInstance;
-(void)SuperOneTableViewCell:(SuperOneTableViewCell *)cell clickAction:(int)index
;
@end

NS_ASSUME_NONNULL_END
