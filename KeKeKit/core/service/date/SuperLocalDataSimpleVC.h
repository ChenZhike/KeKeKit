//
//  SuperLocalDataSimpleVC.h
//  KeKeKit
//
//  Created by CZK on 2019/12/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperOneVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SuperLocalDataSimpleVC : SuperOneVC
@property(nonatomic,copy,nullable)NSString*cellname;
@property(nonatomic,assign)BOOL isnib;
-(void)initSimplePros;
@end

NS_ASSUME_NONNULL_END
