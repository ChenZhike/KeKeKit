//
//  ChoosePersonVC.h
//  KeKeKit
//
//  Created by CZK on 2019/9/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import "ChooseVCSimple.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChoosePersonVC : ChooseVCSimple
@property(nonatomic,strong,nullable)UIButton* selB;
@property(nonatomic,assign)int totalcount;
@property(nonatomic,assign)BOOL is_student;
@end

NS_ASSUME_NONNULL_END
