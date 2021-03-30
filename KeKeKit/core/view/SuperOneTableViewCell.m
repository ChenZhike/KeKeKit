    //
    //  SuperOneTableViewCell.m
    //  KeKeKit
    //
    //  Created by KeKe on 2021/03/30.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import "SuperOneTableViewCell.h"
@implementation SuperOneTableViewCell
+(CGFloat)suggestedHWithData:(NSObject*)obj
{
    return 0;
}
-(void)configWithData:(NSObject*)obj
{
        //self.contentView.backgroundColor=GrayBlackColor;
}
+(NSDictionary*)constDic
{
    return @{};
}
- (void)awakeFromNib {
    [super awakeFromNib];
        // Initialization code
    if (!self.constdic) {
        self.constdic=[[self class]constDic];
    }
}
- (void)addAttriLabWithframe:(CGRect)frame text:(NSString*)text  perh:(CGFloat)perh
{
    VerticallyAlignedLabel*alab=[[VerticallyAlignedLabel alloc]initWithFrame:frame];
        //    UILabel*alab=[[UILabel alloc]initWithFrame:frame];
    alab.numberOfLines=0;

    NSAttributedString*attrstr=[NSAttributedString contentAttributeWithPerH:perh text:text];
    alab.attributedText=attrstr;
    [self.contentView addSubview:alab];
}
- (UILabel*)addSimpleLab:(CGRect)frame text:(NSString*)text ls:(LabelStyle*)ls
{
    UIView*fatherView=self.contentView;
    UILabel*alab=[[UILabel alloc]initWithFrame:frame];
    [alab fillLS:ls];
    alab.text=text;
    [fatherView addSubview:alab];
    return alab;
}
- (UILabel*)addTitleVieWithY:(CGFloat)nowY title:(NSString*)title ls:(LabelStyle*)ls h:(CGFloat)h
{
    UIView*fatherView=self.contentView;
    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WINDOWW, ls.font.pointSize)];
    [alab fillLS:ls];
    alab.center=CGPointMake(WINDOWW/2, nowY+h/2);
    alab.text=title;

    [fatherView addSubview:alab];
    return alab;
}
-(void)addWhiteBackTopCorner
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=self.contentView.bounds;
    backView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:backView];
    [self.contentView sendSubviewToBack:backView];
    [backView topCorner:APPCorner*2];
}
- (void)addTopPicAndCornerStyle
{
    [self.contentView addTopPicAndCornerView];
}
-(void)shadowStyleWithBackView:(UIView*)backview
{
    [backview corner:APPCorner];
    [backview shadowWithOffset:5];
    self.backgroundColor=[UIColor clearColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

        // Configure the view for the selected state
}

@end
