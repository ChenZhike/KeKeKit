//
//  FileCell.h
//  KeKeKit
//
//  Created by CZK on 2019/12/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperOneTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileCell : SuperOneTableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selB;
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@end

NS_ASSUME_NONNULL_END
