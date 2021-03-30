//
//  TeacherCollectionViewCell.m
//  KeKeKit
//
//  Created by CZK on 2019/8/30.
//  Copyright © 2019 czk. All rights reserved.
//

#import "TeacherCollectionViewCell.h"

@implementation TeacherCollectionViewCell
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return 130;
}
- (void)awakeFromNib {
    [super awakeFromNib];


    [self.avatar cornerHG2];

    {
    UIButton*morebtn=[[UIButton alloc]initWithFrame:RECT(10, 10, 20, 20)];
    [morebtn setImage:[UIImage imageNamed:@"yuan_weixuan"] forState:UIControlStateNormal];
    [morebtn setImage:[UIImage imageNamed:@"yuan_yixuan"] forState:UIControlStateSelected];
    morebtn.hidden=YES;
    [self.contentView addSubview:morebtn];
    self.selB=morebtn;
    }
    [self.backView corner:APPCorner];
    [self corner:APPCorner];
    [self shadowWithOffset:5];

    // Initialization code
}
- (void)configWithData:(NSDictionary *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.height=h;
    self.contentView.height=h;
    self.name.text=[obj objectForKey:@"name"];
    [self.avatar setPortraitWithImgstr:[obj objectForKey:@"headPic"]];
//    workStatus    int    工作状态 1=正常 2=休假 3=离职
    int workStatus=[[obj objectForKey:@"workStatus"]intValue];
    if (workStatus==2) {
        self.qingjia.hidden=NO;
    }
    else
        {
        self.qingjia.hidden=YES;
        }
    [self fillStar:obj];

    [self commonCellBackColor];
}
-(void)fillStar:(NSDictionary *)obj
{
    id userLevel=[obj objectForKey:@"userLevel"];
    [self.starsView removeFromSuperview];
    if (userLevel&&[userLevel intValue]>=0) {

        FiveStarView*fsv=[[FiveStarView alloc]initWithImgW:20 imgh:10 space:0 whiteOrBlackBack:NO];
        fsv.centerX=self.backView.width/2;
        fsv.y=110;
        int userLevel_int=[userLevel intValue];
        [fsv fillStarWithCount:userLevel_int];

        [self.backView addSubview:fsv];
    }

}
@end
