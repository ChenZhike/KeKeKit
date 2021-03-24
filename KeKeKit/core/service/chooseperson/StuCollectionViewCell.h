//
//  TeacherCollectionViewCell.h
//  FirstProject
//
//  Created by CZK on 2019/8/30.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperOneCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface StuCollectionViewCell : SuperOneCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
//@property(nonatomic,strong)NSMutableArray* stars;
@property (weak, nonatomic) IBOutlet UIView *backView;
- (void)configWithData:(NSDictionary *)obj;
@property(nonatomic,strong,nullable)UIButton* selB;
@property (weak, nonatomic) IBOutlet UIImageView *qingjia;
@property (weak, nonatomic) IBOutlet UILabel *classNumL;

@end

NS_ASSUME_NONNULL_END
