    //
    //  UILabel+QuickUI.h
    //  FirstProject
    //
    //  Created by CZK on 2019/9/1.
    //  Copyright © 2019 czk. All rights reserved.
    //

#import <UIKit/UIKit.h>
#import "LabelStyle.h"
#define TopMarginValue (123456)
#define CenterMarginValue (666666)
#define BotMarginValue (654321)
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger,LabelType)
{
LabelTypeTitle,//标题
LabelTypeIntro,//简介
LabelTypeDecorate,//装饰
LabelTypeKey,//key
LabelTypeValue//值
};
@interface UILabel (QuickUI)
+(UILabel*)adjutstWHlabWithSuperView:(UIView*)sv ls:(LabelStyle*)ls  text:(NSString*)text origin:(CGPoint)origin;
+(UILabel*)adjutstWHlabWithSuperView:(UIView*)sv attribute:(NSDictionary*)attribute  text:(NSString*)text origin:(CGPoint)origin right_edge:(CGFloat)right_edge;

    //变宽度
+(UILabel*)flexableWidthLabWithX:(CGFloat)x cy:(CGFloat)cy  Text:(NSString*)text font:(UIFont*)font;
+(UILabel*)flexableWidthLabWithXOrY:(BOOL)xory value:(CGFloat)value cy:(CGFloat)cy  Text:(NSString*)text font:(UIFont*)font;
+(UILabel*)flexableWidthLabWithRight:(CGFloat)right cy:(CGFloat)cy  Text:(NSString*)text font:(UIFont*)font;
//单行label（字符串内容，是标题、简介或者装饰或者key或者value，最大宽度）
+(UILabel*)singleLabelWithwords:(NSString*)words labelType:(LabelType)labelType
                               maxW:(CGFloat)maxW;

-(void)fillLS:(LabelStyle*)ls;
    //+(UILabel*)flexableWidthLabWithText:(NSString*)text font:(UIFont*)font;


-(void)prefixStr:(NSString*)str;
-(void)setSocialAttributeWords:(NSString*)words;
- (void)changeXWWithText:(NSString*)text;
- (void)changeCXWWithText:(NSString*)text;

@end

NS_ASSUME_NONNULL_END
