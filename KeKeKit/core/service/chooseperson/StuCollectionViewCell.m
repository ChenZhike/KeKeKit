//
//  TeacherCollectionViewCell.m
//  FirstProject
//
//  Created by CZK on 2019/8/30.
//  Copyright © 2019 czk. All rights reserved.
//

#import "StuCollectionViewCell.h"

@implementation StuCollectionViewCell
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return 130;
}
- (void)awakeFromNib {
    [super awakeFromNib];



    {
    UIButton*morebtn=[[UIButton alloc]initWithFrame:RECT(10, 10, 20, 20)];
    [morebtn setImage:[UIImage imageNamed:@"yuan_weixuan"] forState:UIControlStateNormal];
    [morebtn setImage:[UIImage imageNamed:@"yuan_yixuan"] forState:UIControlStateSelected];
//    morebtn.userInteractionEnabled=NO;
    morebtn.hidden=YES;
    [self.contentView addSubview:morebtn];
    self.selB=morebtn;
    }


    [self.backView corner:APPCorner];
    [self corner:APPCorner];
    [self shadowWithOffset:5];

    // Initialization code
}
-(NSArray*)ivnames
{
    return @[@"teacher_xing2",@"teacher_xing"];
}
- (void)configWithData:(NSDictionary *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.height=h;
    self.contentView.height=h;
      [self.avatar cornerHG2];
    NSString*name=[obj objectForKey:@"name"];
    int sex=[[obj objectForKey:@"sex"]intValue];
    NSString*sex_str=(sex==1)?@"男":@"女";
    self.name.text=[NSString stringWithFormat:@"%@(%@)",name,sex_str];
    [self.avatar setPortraitWithImgstr:[obj objectForKey:@"headPic"]];

    [self commonCellBackColor];



    self.qingjia.hidden=YES;
    id isLeave=[obj objectForKey:@"isLeave"];
    if (isLeave)
        {
        BOOL isLeave_bool=[isLeave intValue]!=0;
        if (isLeave_bool) {
            self.qingjia.hidden=NO;
        }
        else
            {
            self.qingjia.hidden=YES;
            }
        }


    //是评估
    id attendType=[obj objectForKey:@"attendType"];
    if (attendType)
        {
        BOOL attendType_bool=([attendType intValue]==1);
        self.qingjia.image=[UIImage imageNamed:@"pic_yipinggu"];
        if (attendType_bool) {
            self.qingjia.hidden=NO;
        }
        else
            {
            self.qingjia.hidden=YES;
            }
        }

//    isAttend  是否考勤 0=未考勤 否则未已考勤
    id isAttend=[obj objectForKey:@"isAttend"];
    if (isAttend)
        {
        BOOL isAttend_bool=([isAttend intValue]!=0);
        self.qingjia.image=[UIImage imageNamed:@"pic_yikaoqin"];
        if (isAttend_bool) {
            self.qingjia.hidden=NO;
        }
        else
            {
            self.qingjia.hidden=YES;
            }
        }

    //classNum
    id classNum=[obj objectForKey:@"classNum"];
    UILabel*calss_num_l=self.classNumL;
    if (classNum) {
        calss_num_l.hidden=NO;
        NSString*text=[NSString stringWithFormat:@"%@课时",[classNum numOrStringValue]];
        calss_num_l.text=text;

    }
    else
        {
        calss_num_l.hidden=YES;
        }


}
@end
