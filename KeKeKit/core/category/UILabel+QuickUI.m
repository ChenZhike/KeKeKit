    //
    //  UILabel+QuickUI.m
    //  FirstProject
    //
    //  Created by CZK on 2019/9/1.
    //  Copyright © 2019 czk. All rights reserved.
    //

#import "UILabel+QuickUI.h"

@implementation UILabel (QuickUI)
-(void)fillLS:(LabelStyle*)ls
{
    self.textColor=ls.textColor;
    self.font=ls.font;
    self.textAlignment=ls.textAlignment;
}
+(UILabel*)flexableWidthLabWithX:(CGFloat)x cy:(CGFloat)cy  Text:(NSString*)text font:(UIFont*)font
{

    CGFloat width=[text boundingRectWithSize:CGSizeMake(WINDOWW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width;

    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(x, 0, width, font.pointSize*1.2)];
    alab.centerY=cy;
    alab.font=font;
    alab.textColor=HexColor(@"");
    alab.text=text;
    alab.textAlignment=NSTextAlignmentLeft;

    return alab;
}
//单行label（字符串内容，是标题、简介或者装饰或者key或者value，最大宽度）
+(UILabel*)singleLabelWithwords:(NSString*)words labelType:(LabelType)labelType
                           maxW:(CGFloat)maxW
{
    NSArray*fonts=@[TitleFont,IntroFont,DecroFont,KeyFont,ValueFont];
    NSArray*colors=@[BlackColor,BlackColor,SixColor,ThreeColor,BlackColor];
    UIFont*font=fonts[labelType];
    UILabel*lab=[self flexableWidthLabWithX:0 cy:0 Text:words font:font];

    CGFloat width=lab.width;
    if (width>maxW) {
        width=maxW;
        lab.width=width;
    }
    lab.y=0;
    lab.textColor=colors[labelType];

    return lab;
}
-(void)prefixStr:(NSString*)str
{
    NSString*text=self.text;
    if (text.length) {
        self.text=[NSString stringWithFormat:@"%@%@",str,self.text];
    }
    else
        {
        self.text=str;
        }
}
-(void)setSocialAttributeWords:(NSString*)words
{
    NSDictionary*dic=[GlobalAttributeDic social_attriDic];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:words attributes:dic];

    self.attributedText = string;
}
- (void)changeXWWithText:(NSString*)text
{
    self.text=text;
    CGFloat right=self.right;
    CGFloat w= [text getWidthWithFont:self.font];
    self.frame=RECT(right-w, self.y, w, self.height);
}
- (void)changeCXWWithText:(NSString*)text
{
    self.text=text;
    CGFloat cx=self.centerX;
    CGFloat w= [text getWidthWithFont:self.font];
    self.frame=RECT(cx-w/2, self.y, w, self.height);
}
+(UILabel*)adjutstWHlabWithSuperView:(UIView*)sv attribute:(NSDictionary*)attribute  text:(NSString*)text origin:(CGPoint)origin right_edge:(CGFloat)right_edge
{

    NSMutableAttributedString*attrstr=[[NSMutableAttributedString alloc]initWithString:text attributes:attribute];
    CGFloat maxw=sv.width-right_edge-origin.x;
    CGFloat h=[attrstr getHeightWithMaxW:maxw];

    CGFloat width=[attrstr boundingRectWithSize:CGSizeMake(WINDOWW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.width;
       CGFloat x=origin.x;
       if (x==TopMarginValue) {
           x=0;
       }else if (x==CenterMarginValue) {
           x=(sv.width-width)/2;
       }
       CGFloat y=origin.y;
       if (y==TopMarginValue) {
           y=0;
       }else if (y==CenterMarginValue) {
           y=(sv.height-h)/2;
       }

       UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(x, y, width, h)];
        alab.attributedText=attrstr;
       [sv addSubview:alab];

       return alab;
}
@end
