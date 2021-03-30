//
//  GuideVC.h
//  KeKeKit
//
//  Created by CZK on 2019/6/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperOneVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface GuideVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property(nonatomic,assign)int  current_ani_lab_index;
@property (weak, nonatomic) IBOutlet UIButton *enterB;

- (IBAction)gotoMain:(id)sender;

@end

NS_ASSUME_NONNULL_END
