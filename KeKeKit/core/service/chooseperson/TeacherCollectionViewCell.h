//
//  TeacherCollectionViewCell.h
//  KeKeKit
//
//  Created by CZK on 2019/8/30.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TeacherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIImageView *qingjia;
@property (weak, nonatomic) IBOutlet UILabel *name;
//@property(nonatomic,strong)NSMutableArray* stars;
@property(nonatomic,strong,nullable)UIView* starsView;
@property (weak, nonatomic) IBOutlet UIView *backView;
- (void)configWithData:(NSDictionary *)obj;
@property(nonatomic,strong,nullable)UIButton* selB;
@end

NS_ASSUME_NONNULL_END
